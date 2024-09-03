import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {super.firstName,
      super.lastName,
      super.email,
      super.password,
      super.sessionId,
      super.accountId,
      super.country,
      super.username,
      super.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        password: json['password'],
        sessionId: json['session_id'],
        accountId: json['account_id'],
        country: json['country'],
        username: json['username'],
        avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['account_id'] = accountId;
    data['email'] = email;
    data['password'] = password;
    data['session_id'] = sessionId;
    data['country'] = country;
    data['username'] = username;
    data['avatar'] = avatar;
    return data;
  }
}
