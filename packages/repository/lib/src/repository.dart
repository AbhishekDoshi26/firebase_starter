part of repository;

abstract class Repository<T> {
  @protected
  final IDatabase dataSource;

  const Repository(this.dataSource);

  Future<List<T>> getAll();

  Future<T> getById(String id);

  Future<void> post(T data);

  Future<void> put(T data);

  Future<void> delete(T data);
}
