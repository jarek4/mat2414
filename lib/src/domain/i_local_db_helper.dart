abstract class ILocalDbHelper<T> {

  Future<int> add(T item);

  // Future<List<T>> get(List<String> ids);

  Future<List<T>> getAll();

  Future<T?> getSingle(int id);

  Future<int> update(T item);

  Future<int> delete(int id);
}
