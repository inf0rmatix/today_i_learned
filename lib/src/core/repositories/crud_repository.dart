abstract class CrudRepository<T> {
  Stream<EntityChangedEvent<T>> get changes;

  String getUid(T object);

  T setUid(T object, String uid);

  Map<String, dynamic> toJson(T object);

  T fromJson(Map<String, dynamic> json);

  Future<T> create(T object);

  Future<T?> findOne(String uid);

  Future<List<T>> findAll();

  Future<T> update(T object);

  Future<bool> delete(T object);
}

class EntityChangedEvent<T> {
  T object;
  EntityChangedEventType type;

  EntityChangedEvent({
    required this.object,
    required this.type,
  });
}

enum EntityChangedEventType {
  created,
  updated,
  deleted,
}
