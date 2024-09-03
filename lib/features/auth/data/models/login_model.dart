import 'package:equatable/equatable.dart';

class LoginModel extends Equatable{
  final String? email;
  final String? password;

  const LoginModel({
    this.email,
    this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
  
  @override
  List<Object?> get props => [
    email,
    password
  ];
}
