import 'package:cd_client/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cd_client/screen/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'bloc/register_bloc.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBlock>(
          create: (context) => LoginBlock(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        )
      ],
      child: MaterialApp(
          title: "Flutter Tutorial",
          theme: ThemeData(
              fontFamily: "KCC-Ganpan",
              appBarTheme: const AppBarTheme(
                  color: Colors.white,
                  elevation: 0,
                  foregroundColor: Colors.black)),
          home: const Login()),
    );
  }
}
