import 'package:flutter/material.dart';
import 'package:lista_espera/QRCode.dart';
import 'telaQr.dart';
import 'QRCode.dart';

//Construtor
class LinkQRCode extends StatefulWidget {
  const LinkQRCode({ Key? key }) : super(key: key);

  @override
  State<LinkQRCode> createState() => _LinkQRCodeState();
}

class _LinkQRCodeState extends State<LinkQRCode> {
  final controller = TextEditingController(text:"Digite aqui ");

@override
void dispose(){
  controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Qr Code"),
      centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding:EdgeInsets.all(20),
          child: Column(
            children: [
              //Botão que gera o QRCode com o link digitado
              ElevatedButton(onPressed:() {
                Navigator.push(context,MaterialPageRoute(builder: (context)=> QRCode()));
              },
              child: Text("Gerar QR CODE"),),
              //Input que receberá o link para gerar o QRCode
              TextFormField(
               controller: controller,
                decoration: InputDecoration(labelText: "QrCode text",
                hintText: "Digite Aqui",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),suffixIcon: Icon(Icons.qr_code_2)),
              ),
           SizedBox(height: 15,),
             SizedBox(height: 15,),
             //Botão do segundo QRCode
           ElevatedButton(onPressed:() {
             Navigator.push(context, MaterialPageRoute(builder: (context)=> tela3(str: controller.text,)));
           },child: Text("QR CODE2"),)
            ],
          ),
        ),
      ),
    );
  }
}