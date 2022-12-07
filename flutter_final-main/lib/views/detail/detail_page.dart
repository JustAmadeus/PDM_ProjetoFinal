import 'package:flutter/material.dart';
import 'package:trabalho_pdm/main.dart';
import 'package:trabalho_pdm/views/cameraApp/camera.dart';
import 'package:trabalho_pdm/views/home/home_page.dart';
import 'package:trabalho_pdm/widgets/button_custom.dart';

//teste com mobile_scanner
import 'package:trabalho_pdm/views/cameraApp/qrscan.dart';
//

class DetailPage extends StatefulWidget {

/*
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
*/ //Não funciona assim... Dentro do Widget não é inicializado. Precisa provavelmente estar em um escopo como o do exemplo, e instanciar a variável para rodar no camera.dart. No main.


  final String title;
  final String photo;
  const DetailPage({Key? key, required this.photo, required this.title})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();

}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Column(
          children: [
            Center(
                child: Image.network(
              widget.photo,
              fit: BoxFit.cover,
            )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0x44993398)),
                          child: Text(
                            "Popular",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF993398)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 15,
                          ),
                        ),
                        //Esse aqui é o QR Code
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyScanPage(),)),          //TakePicture(camera: cameras.first,))),//Mas aí como passa isso como argumento, se colocar do main para cá, e de cá para camera.dart? Não... Tem algo errado ainda.
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/qr-code.png',
                                width: 50,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              width: 20,
                            ),
                            SizedBox(width: 5),
                            Text('4.5'),
                            SizedBox(width: 15),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Text("Aproveite essa atividade no Braga Clube"),
                    SizedBox(height: 35),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              color: Color(0xFFF9F9F9),
              child: ButtonCustom(
                name: 'Matricule-se',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
