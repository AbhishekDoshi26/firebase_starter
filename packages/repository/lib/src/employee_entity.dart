part of repository;

@JsonSerializable()
class EmployeeEntity {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? avatarAsset;
  int? age;
  String? phoneNumber;
  String? address;
  String? description;

  EmployeeEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.avatarAsset,
    this.age,
    this.phoneNumber,
    this.address,
    this.description,
  });
  factory EmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeEntityToJson(this);
}
