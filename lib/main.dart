import 'package:cd_client/apis/product_api.dart';
import 'package:cd_client/apis/store_api.dart';
import 'package:cd_client/bloc/user_acoount_bloc.dart';
import 'package:cd_client/apis/auth_api.dart';
import 'package:cd_client/screen/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthApi>(
          create: (context) => AuthApi(),
        ),
        RepositoryProvider<ProductApi>(
          create: (context) => ProductApi(),
        ),
        RepositoryProvider<StoreApi>(
          create: (context) => StoreApi(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserAccountBloc(
              authApi: context.read<AuthApi>(),
            ),
          )
        ],
        child: MaterialApp(
          title: "Flutter Tutorial",
          theme: ThemeData(
            fontFamily: "KBO",
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
          home: const Index(),
        ),
      ),
    );
  }
}
