//teste

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

//Agora, precisa estanciar 
/*
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  estes, para chamar o TakePicture(camera:firstCamera,)
*/
//porque sintaxe não aceitou isso direto na detail_page.dart
//As linhas abaixo foram 'desligadas' porque isso aí meio que "roda um app dentro do app" - não acho que isso esteja correto.


/*
void mainCamera() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Retorna o objeto do tipo List<CameraDescription>
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    home: TakePicture(
      camera: firstCamera,
    ),
  ));
}
*/

class TakePicture extends StatefulWidget {
  final CameraDescription camera;
  TakePicture({required this.camera});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TakePictureState();
  }
}

class _TakePictureState extends State<TakePicture> {
  late final CameraController _controller;
  late final Future<void> _initController;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget
          .camera, // widget representa o state. O campo camera foi definido em TakePicture
      ResolutionPreset.max, // resolução da câmera
    );

    _initController = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FutureBuilder<void>(
            future: _initController,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller),
                    ),
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          IconButton(
            onPressed: () {
              _takePhoto(context);
            },
            icon: Icon(Icons.photo_camera),
          )
        ],
      ),
    );
  }

  void _takePhoto(BuildContext context) async {
    // garante que o controller está pronto
    await _initController;

    // Nome do arquivo e caminho
    //final dir = await getTemporaryDirectory(); // função do pacote path_provider
    final dir = await getExternalStorageDirectory() ?? Directory("/");
    final name =
        "img_${DateTime.now()}.png"; // usando a data no nome, evita-se conflito de nomes de arquivos

    // Armazena a foto em uma dado local
    final fullPath = path.join(dir.path, name); // path é
    final image = await _controller.takePicture();
    print(fullPath);
    image.saveTo(fullPath);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Picture taken!"),
      duration: Duration(milliseconds: 600),
    ));
  }
}
