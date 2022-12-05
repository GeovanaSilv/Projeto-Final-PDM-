import 'dart:convert';
import 'package:lista_espera/incluirPessoa.dart';

import 'ctcLista.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// GET --> MOSTRA AS PESSOAS NA LISTA
Future<List<ctcLista>> mostrarLista() async {
  var response =
      await http.get(Uri.parse("https://www.slmm.com.br/CTC/getLista.php"),
          //https://www.slmm.com.br/CTC/ctcApi.php
          headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new ctcLista.fromJson(data)).toList();
  } else {
    throw Exception('Erro inesperado....');
  }
}

Future<ctcLista> deleteNome(String nome) async {
  const urlDelete = "http://www.slmm.com.br/CTC/delete.php?id=1/";
  final http.Response response = await http.delete(
    Uri.parse('urlDelete/$nome'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    return ctcLista.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}

// POST --> INCLUI AS PESSOAS

// DELETE --> DELETAR AS PESSOAS

class listaEspera extends StatefulWidget {
  const listaEspera({Key? key}) : super(key: key);

  @override
  State<listaEspera> createState() => _listaEsperaState();
}

class _listaEsperaState extends State<listaEspera> {
  late Future<List<ctcLista>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = mostrarLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LISTA API",),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const incluirPessoa()));

              },
            ),
          ],
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          child: FutureBuilder<List<ctcLista>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ctcLista> data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        //color: Color.fromARGB(255, 245, 245, 245),
                        child: ListTile(
                          title: Text(data[index].nome),
                          subtitle: Text(data[index].data),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    print("entra no delete");
                                  },
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red)
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
        ));
  }
}
