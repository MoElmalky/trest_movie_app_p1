import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../config/theme/theme.dart';

//import 'features/home/presentation/pages/home_page.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/temp_splash_page.dart';
import 'injection_container.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => instance<AuthBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'T-Rest',
        theme: themeData,
        home: const TempSplashPage(),
      ),
    );
  }
}
