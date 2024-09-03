import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/colors.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/auth_bloc.dart';
import 'temp_login_page.dart';
import 'temp_signup_page.dart';

class TempSplashPage extends StatefulWidget {
  const TempSplashPage({super.key});

  @override
  State<TempSplashPage> createState() => _TempSplashPageState();
}

class _TempSplashPageState extends State<TempSplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      context.read<AuthBloc>().add(const CheckUserEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          } else if (state is Unauthenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const TempLoginPage()));
          } else if (state is AuthInitial){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const TempSignUpPage()));
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [TRestColors.secondaryDark, TRestColors.primary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
