import 'dart:convert';

import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';

class EntidadeUmModel extends EntidadeUm {
  final String atributoUm;
  final String atributoDois;
  final String atributotres;

  EntidadeUmModel({this.atributoUm, this.atributoDois, this.atributotres})
      : super(
          atributoUm: atributoUm,
          atributoDois: atributoDois,
          atributotres: atributotres,
        );

  Map<String, dynamic> toMap() {
    return {
      'atributoUm': atributoUm,
      'atributoDois': atributoDois,
      'atributotres': atributotres,
    };
  }

  factory EntidadeUmModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EntidadeUmModel(
      atributoUm: map['atributoUm'],
      atributoDois: map['atributoDois'],
      atributotres: map['atributotres'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EntidadeUmModel.fromJson(String source) =>
      EntidadeUmModel.fromMap(json.decode(source));
}
