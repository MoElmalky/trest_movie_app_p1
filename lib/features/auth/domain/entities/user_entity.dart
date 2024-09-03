import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? sessionId;
  final int? accountId;
  final String? country;
  final String? username;
  final String? avatar;

  const UserEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.sessionId,
    this.accountId,
    this.country,
    this.username,
    this.avatar,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        sessionId,
        accountId,
        country,
        username,
        avatar
      ];
}
