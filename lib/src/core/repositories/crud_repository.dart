abstract class CrudRepository<T> {
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
