import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget{
  String str = "oi";

  QRCode({Key? key, this.str: "default"}) :super(key: key);

  @override
  State<QRCode> createState() => _qrcodeState();
}

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
            QrImage(data :widget.str,
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