import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
class CtcLista {
  String nome;
  String data;

  CtcLista(this.nome, this.data);

  Map toJson() => {'nome': nome, 'data': data};

  factory CtcLista.fromJson(dynamic json) {
    if (json['data'] == null) json['data'] = "01/01/2022 00:00:00";

    return CtcLista(json['nome'] as String, json['data'] as String);
  }
  @override
  String toString() {
    // TODO: implement toString
    return '{${this.nome}, ${this.data}}';
  }
}
