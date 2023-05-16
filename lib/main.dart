import 'package:cd_client/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cd_client/screen/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'bloc/register_bloc.dart';

var logger = Logger(
  printer: PrettyPrinter(lineLength: 60, colors: true),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(lineLength: 60, methodCount: 0),
);

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
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
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
