import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';


class tela3 extends StatefulWidget {
String str ="oi";

 tela3 ({Key?  key, this.str: "default"}) :super(key: key);

  @override
  State<tela3> createState() => _tela3State();
}

class _tela3State extends State<tela3> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
    appBar: AppBar(
      title: Text("QR CODE"),
      centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding:EdgeInsets.all(20),
          child: Column(
            children: [
              ElevatedButton(onPressed:() {
                Navigator.pop(context);
              },
              child: Text("Voltar")),
  QrImage(data :widget.str 
  ,version: QrVersions.auto,
  size: 200.0,
  gapless: false,
  )
            ],
          ),
        ),
      ),
    );
  }
}