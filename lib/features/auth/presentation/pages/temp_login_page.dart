import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../config/theme/colors.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../data/models/login_model.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/temp_password_field.dart';
import '../widgets/temp_text_field.dart';
import 'temp_signup_page.dart';


class TempLoginPage extends StatelessWidget {
  const TempLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formField = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formField,
          child: Column(children: [
            const SizedBox(
              height: 30,
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
            InkWell(
              onTap: () {
                if (formField.currentState!.validate()) {
                  context.read<AuthBloc>().add(LoginEvent(LoginModel(
                      email: emailController.text.trim(),
                      password: passwordController.text)));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
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
                    'Login',
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
                    text: 'New To',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const TextSpan(
                    text: ' T-Rest',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: TRestColors.secondary,
                    ),
                  ),
                  const TextSpan(
                    text: '?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                      text: ' Sign Up ',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TempSignUpPage()));
                        }),
                  const TextSpan(
                    text: 'Now.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
