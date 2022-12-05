import 'package:flutter/material.dart';

class incluirPessoa extends StatefulWidget {
  const incluirPessoa({Key? key}) : super(key: key);

  @override
  State<incluirPessoa> createState() => _incluirPessoaState();
}

class _incluirPessoaState extends State<incluirPessoa> {
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
            TextField(),

            new Padding(padding: const EdgeInsets.only(top: 20)),

            Text("Data"),
            new Padding(padding: const EdgeInsets.only(top: 20)),
            // INPUT DE DATA
            new TextField(),

            new Padding(padding: const EdgeInsets.only(top: 20)),
            // BOTAO DE INCLUIR
            MaterialButton(
                child: new Text("INCLUIR"),
                color: Color.fromARGB(255, 212, 132, 181),
                onPressed: incluir)
          ],
        ),
      ),
    );
  }
}

void incluir() {
  print("ta entrando amigo !!");
}

// metodo de incluir - post
// apagar - delete
// mostrar - get -- FEITO
