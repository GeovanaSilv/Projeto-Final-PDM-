import 'package:lista_espera/ctclista.dart';

abstract class Repositorio {
//POST
  Future<String> postPessoa(ctcLista ctclista);

//DELETE
  Future<String> deletePessoa(ctcLista ctclistas);
}
