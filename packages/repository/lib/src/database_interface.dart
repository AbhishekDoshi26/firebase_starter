part of repository;

abstract class IDatabase<T> {
  Future<List<T>> getAll();

  Future<T> getById(String id);

  //Return generated ID
  Future<String> post(T entity);

  Future<void> put(T entity);

  Future<void> delete(T entity);
}
