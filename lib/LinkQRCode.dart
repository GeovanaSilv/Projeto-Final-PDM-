import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lista_espera/QRCode.dart';
import 'QRCode.dart';

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
              ElevatedButton(onPressed:() {
                Navigator.push(context,MaterialPageRoute(builder: (context)=> QRCode()));
              },
              child: Text("Gerar QR CODE"),),
              TextFormField(
               controller: controller,
                decoration: InputDecoration(labelText: "QrCode text",
                hintText: "Digite Aqui",
                errorText: "Digite corretamente sua Anta",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),suffixIcon: Icon(Icons.qr_code_2)),
              ),
           SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}