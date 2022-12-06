import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

//Constutor
class QRCode extends StatefulWidget{
  String str = "oi";

  QRCode({Key? key, this.str: "default"}) :super(key: key);

  @override
  State<QRCode> createState() => _qrcodeState();
}

//Tela onde irá aparecer o QRCode que já contém o link
class _qrcodeState extends State<QRCode>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR CODE"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Voltar")),
            //Aqui ele converte o link "www.slmm.com.br/CTC/getLista.php" em um QRCode funcional
            QrImage(data :"www.slmm.com.br/CTC/getLista.php",
                    version: QrVersions.auto,
                    size: 200.0,
                    gapless: false,
              )
            ],
          ),
        )
      ),
    );
  }
}