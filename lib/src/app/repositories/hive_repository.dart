import 'dart:async';

import 'package:hive/hive.dart';
import 'package:today_i_learned/src/app/repositories/repositories.dart';

abstract class HiveRepository<T> implements CrudRepository<T> {
  static const _idCounterKey = 'idCounter';

  final String Function(T object) _getUid;
  final T Function(T object, String uid) _setUid;
  final Map<String, dynamic> Function(T object) _toJson;
  final T Function(Map<String, dynamic> json) _fromJson;

  final StreamController<EntityChangedEvent<T>> _changedStreamController = StreamController.broadcast();

  @override
  Stream<EntityChangedEvent<T>> get changes => _changedStreamController.stream;

  final String boxName;

  late final Box box;

  HiveRepository({
    required this.boxName,
    required String Function(T object) getUid,
    required T Function(T object, String uid) setUid,
    required Map<String, dynamic> Function(T object) toJson,
    required T Function(Map<String, dynamic> json) fromJson,
  })  : _getUid = getUid,
        _setUid = setUid,
        _toJson = toJson,
        _fromJson = fromJson;

  Future<void> initialize() async {
    box = await Hive.openBox(boxName);
  }

  Future<void> dispose() async {
    await box.close();
  }

  @override
  Future<T> create(T object) async {
    var idCounter = box.get(_idCounterKey) as int? ?? 0;
    idCounter++;

    final createdObject = setUid(object, idCounter.toString());

    await box.putAll({
      _idCounterKey: idCounter,
      getUid(createdObject): toJson(createdObject),
    });

    final event = EntityChangedEvent<T>(
      object: createdObject,
      type: EntityChangedEventType.created,
    );

    _changedStreamController.add(event);

    return createdObject;
  }

  @override
  Future<List<T>> findAll() async {
    final data = box.values.whereType<Map>();

    return data.map((json) => fromJson(json.cast<String, dynamic>())).toList();
  }

  @override
  Future<T?> findOne(String uid) async {
    final json = box.get(uid) as Map?;

    return json == null ? null : fromJson(json.cast<String, dynamic>());
  }

  @override
  Future<T> update(T object) async {
    await box.put(getUid(object), toJson(object));

    final event = EntityChangedEvent<T>(
      object: object,
      type: EntityChangedEventType.updated,
    );

    _changedStreamController.add(event);

    return object;
  }

  @override
  Future<bool> delete(T object) async {
    await box.delete(getUid(object));

    final event = EntityChangedEvent<T>(
      object: object,
      type: EntityChangedEventType.deleted,
    );

    _changedStreamController.add(event);

    return true;
  }

  @override
  String getUid(T object) => _getUid(object);

  @override
  T setUid(T object, String uid) => _setUid(object, uid);

  @override
  Map<String, dynamic> toJson(T object) => _toJson(object);

  @override
  T fromJson(Map<String, dynamic> json) => _fromJson(json);
}
