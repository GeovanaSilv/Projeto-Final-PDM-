import 'dart:convert';
import 'package:lista_espera/incluirPessoa.dart';
import 'package:lista_espera/ctclista.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lista_espera/LinkQRCode.dart';

// GET --> MOSTRA AS PESSOAS NA LISTA
Future<List<CtcLista>> mostrarLista() async {
  var response =
      await http.get(Uri.parse("https://www.slmm.com.br/CTC/getLista.php"),
          //https://www.slmm.com.br/CTC/ctcApi.php
          headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new CtcLista.fromJson(data)).toList();
  } else {
    throw Exception('Erro inesperado....');
  }
}

// DELETE --> DELETAR AS PESSOAS
Future<String> deletePessoa(String nome) async {
  var response = await http.delete(
      Uri.parse("https://www.slmm.com.br/CTC/delete.php?nome=$nome"),
      headers: {"Accept": "application/json"});
  if (response.statusCode != 200) throw Exception('Erro inesperado...');

  return response.body; //json.decode(response.body);
}

//Construtor
class listaEspera extends StatefulWidget {
  const listaEspera({Key? key}) : super(key: key);

  @override
  State<listaEspera> createState() => _listaEsperaState();
}

//Construtor
class _listaEsperaState extends State<listaEspera> {
  late Future<List<CtcLista>> futureData;
  
  set id(id) {}


@override
void initState() {
  super.initState();
  futureData = mostrarLista();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(
          "LISTA API",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            //Botão que redireciona para a parte de incluir pessoa
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const incluirPessoa()));
            },
          ),
          IconButton(
              //Botão que redireciona para o Input do QRCode
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LinkQRCode()));
              },
              icon: Icon(Icons.qr_code))
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: FutureBuilder<List<CtcLista>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //Listagem das pessoas
                List<CtcLista> data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(data[index].nome),
                        subtitle: Text(data[index].data),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    var nome = data[index].nome;
                                    deletePessoa(nome);
                                    futureData = mostrarLista();
                                    print(deletePessoa(nome));
                                  });
                                },
                                icon: const Icon(Icons.delete),
                                color: Color.fromARGB(255, 167, 184, 171))
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      )
    );
  }
}
