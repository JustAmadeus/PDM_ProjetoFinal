import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pdm/core/bloc/register_bloc.dart';
import 'package:trabalho_pdm/widgets/button_custom.dart';
import 'package:trabalho_pdm/widgets/text_field_custom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterBloc bloc;

  var _email = TextEditingController();
  var _password = TextEditingController();
  var _name = TextEditingController();
  var step = "user";

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<RegisterBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          image: step == "result"
              ? DecorationImage(image: AssetImage("assets/images/Pattern.png"), fit: BoxFit.cover)
              : DecorationImage(image: AssetImage("assets/images/home.png"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: step == "result" ? EdgeInsets.all(0.0) : EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (step == "user")
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(onTap: () => Navigator.pop(context), child: Image.asset('assets/images/Group.png')),
                          SizedBox(height: 20),
                          Text(
                            "Registre-se para ter acesso ao aplicativo",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Esses dados serão necessários para login no app",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                color: Color(0xFFDFDDDD), borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: TextFieldCustom(
                                      controller: _name,
                                      hint: "Nome Completo",
                                      border: false,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: TextFieldCustom(
                                      controller: _email,
                                      hint: "E-mail",
                                    )),
                                Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: TextFieldCustom(
                                      controller: _password,
                                      hint: "Senha",
                                      obscure: true,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (step == "location")
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(onTap: () => Navigator.pop(context), child: Image.asset('assets/images/Group.png')),
                        SizedBox(height: 20),
                        Text(
                          "Defina sua localização",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 10, // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/location.png'),
                                  SizedBox(width: 15),
                                  Expanded(
                                      child: Text(
                                    "Sua Localização",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ))
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEDEDED), borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "Definir Localização",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                if (step == "result")
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Image.asset('assets/images/check.png')),
                          SizedBox(height: 30),
                          Text(
                            "Parabéns!",
                            style: TextStyle(fontSize: 30, color: Color(0xFF53E88B), fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text("Sua conta está pronta para uso",
                              style: TextStyle(fontSize: 23, color: Color(0xFF000000), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: ButtonCustom(
                    name: "Próximo",
                    onTap: () {
                      switch (step) {
                        case "user":
                          setState(() {
                            step = "location";
                          });
                          break;
                        case "location":
                          setState(() {
                            step = "result";
                          });
                          break;
                        case "result":
                          setState(() {
                            Navigator.pop(context);
                          });
                          break;
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
