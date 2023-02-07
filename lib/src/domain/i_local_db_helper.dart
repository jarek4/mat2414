abstract class ILocalDbHelper<T> {
  Future<int> create(T item);

  Future<List<T>> getByIds(List<String> ids);

  Future<List<T>> readAll([String? ownerId]);

  Future<T?> readSingle(String id);

  Future<int> update(T item);

  Future<int> delete(String id);
}
