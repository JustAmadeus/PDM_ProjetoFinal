import 'package:trabalho_pdm/core/bloc/app_event.dart';
import 'package:trabalho_pdm/core/bloc/base_bloc.dart';

import '../../locator.dart';

enum AppState { SPLASH, WALK, LOGIN, HOME }

class AppBloc extends BaseBloc {
  var state;

  AppBloc() {
    initState(AppState.SPLASH);

    eventBus.on().listen((event) async {
      if (event is AppLoginIn) {
        print("aqui333333");
        changeState(AppState.HOME);
        print("aqui2");
      }
    });
  }

  Future<void> initialize() async {
    Future.delayed(Duration(seconds: 5), () {
      changeState(AppState.LOGIN);
    });
  }
}
