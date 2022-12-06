import 'package:flutter/material.dart';
import 'package:lista_espera/ctclista.dart';
import 'package:lista_espera/listaEspera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

// Inserir uma pessoa na lista de espera
Future<String> IncluirPessoa(String nome) async {
  //pessoa CtcLista = CtcLista('nome:nome', 'data:data');
  CtcLista lista =
      CtcLista(nome, DateFormat("dd/MM/yy HH:mm:ss").format(DateTime.now()));

  Map<dynamic, dynamic> data = lista.toJson();
  String body = json.encode(data);

  //API
  var response = await http.post(
      Uri.parse("https://www.slmm.com.br/CTC/insere.php"),
      headers: {"Accept": "application/json"},
      body: body);

  if (response.statusCode != 200) throw Exception('Erro inesperado');

  return response.body;
}

//Construtor
class incluirPessoa extends StatefulWidget {
  const incluirPessoa({Key? key}) : super(key: key);

  @override
  State<incluirPessoa> createState() => _incluirPessoaState();
}

class _incluirPessoaState extends State<incluirPessoa> {
  final TextEditingController t1 = new TextEditingController();
  late Future<String> _futureData;
  late Future<List<CtcLista>> futureDatas;

  @override
  void initState() {
    super.initState();
    futureDatas = mostrarLista();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(" Projeto Final --Lista ")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome"),

            new Padding(padding: const EdgeInsets.only(top: 20)),

            // INPUT DE NOME
            new TextField(
              decoration: new InputDecoration(hintText: "Informe sua Senha"),
              controller: t1,
            ),

            new Padding(padding: const EdgeInsets.only(top: 20)),

            new Padding(padding: const EdgeInsets.only(top: 20)),
            // BOTAO DE INCLUIR
            MaterialButton(
                child: new Text("INCLUIR"),
                color: Color.fromARGB(255, 212, 132, 181),
                onPressed: () {
                  setState(() {
                    //var data = data[index].nome;
                    _futureData = IncluirPessoa(t1.text);
                    print(t1.text);
                    futureDatas = mostrarLista();
                    print(IncluirPessoa(t1.text));
                  });
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
  
}

