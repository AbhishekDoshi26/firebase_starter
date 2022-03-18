// GENERATED CODE - DO NOT MODIFY BY HAND

part of repository;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeEntity _$EmployeeEntityFromJson(Map<String, dynamic> json) =>
    EmployeeEntity(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      avatarAsset: json['avatarAsset'] as String?,
      age: json['age'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$EmployeeEntityToJson(EmployeeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'avatarAsset': instance.avatarAsset,
      'age': instance.age,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'description': instance.description,
    };
