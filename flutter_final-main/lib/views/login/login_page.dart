import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pdm/core/bloc/login_bloc.dart';
import 'package:trabalho_pdm/views/register/register_page.dart';
import 'package:trabalho_pdm/widgets/button_custom.dart';
import 'package:trabalho_pdm/widgets/text_field_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc bloc;
  var _email = TextEditingController();
  var _password = TextEditingController();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<LoginBloc>(context);
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Text(
                    'Faça Login na sua conta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFieldCustom(
                          controller: _email,
                          hint: 'E-mail',
                          keyBoardType: TextInputType.emailAddress,
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFieldCustom(
                            controller: _password,
                            hint: 'Senha',
                            obscure: true),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage())),
                        child: Text(
                          "Registre-se",
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Ou Conecte-se com: ',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              color: Color(0xFFF9F9F9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/face.svg'),
                              SizedBox(width: 15),
                              Text('Facebook')
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              color: Color(0xFFF9F9F9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/google.svg'),
                              SizedBox(width: 15),
                              Text('Google')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Esqueceu sua senha ?',
                    style: TextStyle(
                        fontSize: 13),
                  ),
                  SizedBox(height: 30),
                  ButtonCustom(
                    name: 'Login',
                    onTap: () async => {
                      email = _email.text,
                      password = _password.text,
                      await bloc.login(email, password, context),
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
