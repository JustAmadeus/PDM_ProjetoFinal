import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pdm/core/bloc/app_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AppBloc? bloc;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<AppBloc>(context);
    var allW = MediaQuery.of(context).size.width;
    return Material(
      child: Image.asset(
        'assets/images/splash.png',
        width: allW,
        fit: BoxFit.cover,
      ),
    );
  }
}
