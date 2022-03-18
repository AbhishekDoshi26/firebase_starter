part of repository;

class EmployeesRepository implements Repository<EmployeeEntity> {
  @override
  IDatabase<EmployeeEntity> dataSource;

  EmployeesRepository(this.dataSource) : super();

  @override
  Future<List<EmployeeEntity>> getAll() async {
    try {
      final employees = await dataSource.getAll();
      return employees;
    } catch (err) {
      throw ('Error: $err while fetching users in [EmployeesRepository.getEmployees]');
    }
  }

  @override
  Future<EmployeeEntity> getById(String id) async {
    try {
      final employee = await dataSource.getById(id);
      return employee;
    } catch (err) {
      throw ('Error: $err while fetching users in [UsersRepository.getEmployee]');
    }
  }

  @override
  Future<void> post(EmployeeEntity employee) async {
    try {
      await dataSource.post(employee);
    } catch (err) {
      throw 'Error: $err in [usersRepository.addEmployee]';
    }
  }

  @override
  Future<void> put(EmployeeEntity employee) async {
    try {
      await dataSource.put(employee);
    } catch (err) {
      throw 'Error: $err in [usersRepository.updateEmployee]';
    }
  }

  @override
  Future<void> delete(EmployeeEntity employee) async {
    try {
      await dataSource.delete(employee);
    } catch (err) {
      throw 'Error: $err in [usersRepository.deleteEmployee]';
    }
  }
}
