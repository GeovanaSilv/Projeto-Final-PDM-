import 'package:flutter/material.dart';
import 'package:lista_espera/listaEspera.dart';
import 'package:lista_espera/incluirPessoa.dart';

void main() {
runApp(MaterialApp(
//
debugShowCheckedModeBanner: false,
theme: ThemeData(
appBarTheme: AppBarTheme(elevation: 0.0)


),
home: listaEspera(),
));

}
