class CreateUserParams {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  const CreateUserParams(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
