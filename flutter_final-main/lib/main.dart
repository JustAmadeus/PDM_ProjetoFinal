import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pdm/core/bloc/app_bloc.dart';
import 'package:trabalho_pdm/core/bloc/login_bloc.dart';
import 'package:trabalho_pdm/core/bloc/register_bloc.dart';
import 'package:trabalho_pdm/locator.dart';
import 'package:trabalho_pdm/views/main/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//testando aqui a minha hipótese.
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
//As variáveis do teste terminam aqui.

  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    setupLocator();
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppBloc(), lazy: false),
        ChangeNotifierProvider(create: (context) => LoginBloc()),
        ChangeNotifierProvider(create: (context) => RegisterBloc()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
