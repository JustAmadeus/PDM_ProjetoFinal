import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String name;
  final GestureTapCallback? onTap;
  const ButtonCustom({Key? key, required this.name, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 90),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.8459399938583374, 0.1310659646987915),
                end: Alignment(-0.1310659646987915, 0.11150387674570084),
                colors: [Color.fromRGBO(98, 33, 98, 0.7), Color.fromRGBO(191, 64, 191, 1)]),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Text(name, textAlign: TextAlign.center, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),),
      ),
    );
  }
}
