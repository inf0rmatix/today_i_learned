import 'dart:async';

import 'package:today_i_learned/src/core/repositories/crud_repository.dart';

class MemoryRepository<T> implements CrudRepository<T> {
  int _idCounter = 0;

  final List<T> _data = [];

  final String Function(T object) _getUid;
  final T Function(T object, String uid) _setUid;
  final Map<String, dynamic> Function(T object) _toJson;
  final T Function(Map<String, dynamic> json) _fromJson;

  final StreamController<EntityChangedEvent<T>> _changedStreamController = StreamController.broadcast();

  @override
  Stream<EntityChangedEvent<T>> get changes => _changedStreamController.stream;

  MemoryRepository({
    required String Function(T object) getUid,
    required T Function(T object, String uid) setUid,
    required Map<String, dynamic> Function(T object) toJson,
    required T Function(Map<String, dynamic> json) fromJson,
  })  : _getUid = getUid,
        _setUid = setUid,
        _toJson = toJson,
        _fromJson = fromJson;

  @override
  Future<T> create(T object) async {
    _idCounter++;

    final String uid = _idCounter.toString();

    final createdObject = setUid(object, uid);

    _data.add(createdObject);

    _changedStreamController.add(
      EntityChangedEvent<T>(
        object: createdObject,
        type: EntityChangedEventType.created,
      ),
    );

    return createdObject;
  }

  @override
  Future<bool> delete(T object) async {
    _data.removeWhere((element) => getUid(element) == getUid(object));

    _changedStreamController.add(
      EntityChangedEvent<T>(
        object: object,
        type: EntityChangedEventType.deleted,
      ),
    );

    return true;
  }

  @override
  Future<List<T>> findAll() async {
    return _data.toList();
  }

  @override
  Future<T?> findOne(String uid) async {
    final matches = _data.where((element) => getUid(element) == uid);

    return matches.isEmpty ? null : matches.first;
  }

  @override
  Future<T> update(T object) async {
    final index = _data.indexWhere((element) => getUid(element) == getUid(object));

    _data[index] = object;

    _changedStreamController.add(
      EntityChangedEvent<T>(
        object: object,
        type: EntityChangedEventType.updated,
      ),
    );

    return object;
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
