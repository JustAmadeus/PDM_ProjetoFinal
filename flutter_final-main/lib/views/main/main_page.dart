import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pdm/core/bloc/app_bloc.dart';
import 'package:trabalho_pdm/views/home/home_page.dart';
import 'package:trabalho_pdm/views/login/login_page.dart';
import 'package:trabalho_pdm/views/splash/splash_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AppBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await bloc.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<AppBloc>(context);

    switch (bloc.state) {
      case AppState.SPLASH:
        return const SplashPage();
      case AppState.LOGIN:
        return const LoginPage();
      case AppState.HOME:
        return const HomePage();
      default:
        return Scaffold(
          body: Stack(
            children: [
              Builder(builder: (context) {
                return const HomePage();
              })
            ],
          ),
        );
    }
    // return LoginPage();
  }
}
