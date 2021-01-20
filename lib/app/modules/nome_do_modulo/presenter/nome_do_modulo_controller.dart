import 'package:mobx/mobx.dart';

import 'stores/nome_do_modulo_store.dart';

part 'nome_do_modulo_controller.g.dart';

class NomeDoModuloController = _NomeDoModuloControllerBase
    with _$NomeDoModuloController;

abstract class _NomeDoModuloControllerBase with Store {
  NomeStore nomeStore;

  _NomeDoModuloControllerBase({this.nomeStore});

  buttonClick() async {
    nomeStore.fetchData();
  }
}
