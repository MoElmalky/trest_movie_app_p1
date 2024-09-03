import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../bloc/auth_bloc.dart';

class TempConfirmPage extends StatelessWidget {
  const TempConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            context.read<AuthBloc>().add(ConfirmSignUpEvent());
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            width: 180,
            height: 50,
          ),
        ),
      ),
    );
  }
}
