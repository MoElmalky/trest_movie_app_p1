import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/parameters/create_user_params.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/temp_password_field.dart';
import '../widgets/temp_text_field.dart';
import 'temp_confirm_page.dart';
import 'temp_login_page.dart';

class TempSignUpPage extends StatelessWidget {
  const TempSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formField = GlobalKey<FormState>();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formField,
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 180,
                  child: TempTextField(
                    controller: firstNameController,
                    labelText: "First Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 180,
                  child: TempTextField(
                    controller: lastNameController,
                    labelText: "Last Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TempTextField(
                controller: emailController,
                labelText: "Email",
                validator: (value) {
                  bool emailValidation =
                      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                          .hasMatch(value!);
                  if (!emailValidation) {
                    return 'Please, Enter A Valid Email.';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TempPasswordField(
                controller: passwordController,
                labelText: "Password",
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password must be at least 6 letters long';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TempPasswordField(
                controller: confirmPasswordController,
                labelText: "Confirm Password",
                validator: (value) {
                  if (value!.compareTo(passwordController.text) != 0) {
                    return 'Password doesn\'t Match';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                if (formField.currentState!.validate()) {
                  context.read<AuthBloc>().add(SignUpEvent(CreateUserParams(
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text)));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TempConfirmPage()));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 180,
                height: 50,
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Already Have An Account?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                      text: ' Login ',
                      style: const TextStyle(fontSize: 16, color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TempLoginPage()));
                        }),
                  const TextSpan(
                    text: 'Now.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
