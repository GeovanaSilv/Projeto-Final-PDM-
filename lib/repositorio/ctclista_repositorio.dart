import 'package:lista_espera/ctclista.dart';
import 'package:lista_espera/repositorio/repositorio.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
class repositorio implements Repositorio {
// http
  final insere_URL = 'https://www.slmm.com.br/CTC/insere.php';
  final apaga_URL = 'https://www.slmm.com.br/CTC/delete.php?id=1';


  @override
  Future<String> deletePessoa(ctcLista ctclistas) {
    // TODO: implement deletePessoa
    throw UnimplementedError();
  }

  @override
  Future<String> postPessoa(ctcLista ctclista) {
    // TODO: implement postPessoa
    throw UnimplementedError();
  }
}
