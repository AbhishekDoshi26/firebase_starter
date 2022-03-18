part of auth;

@JsonSerializable()
class UserEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? imageUrl;

  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  List<Object?> get props => [id, firstName, lastName, email, imageUrl];

  @override
  bool get stringify => false;
}
