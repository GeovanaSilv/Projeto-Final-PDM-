class ctcLista {
  String nome;
  String data;

  ctcLista(this.nome, this.data);

  Map toJson() => {'nome': nome, 'data': data};

  factory ctcLista.fromJson(dynamic json) {
    if (json['data'] == null) json['data'] = "01/01/2022 00:00:00";

    return ctcLista(json['nome'] as String, json['data'] as String);
  }
  @override
  String toString() {
    // TODO: implement toString
    return '{${this.nome}, ${this.data}}';
  }
}
