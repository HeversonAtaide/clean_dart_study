import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/usecases/fazer_algo.dart';

part 'nome_do_modulo_store.g.dart';

class NomeStore = _NomeStoreBase with _$NomeStore;

abstract class _NomeStoreBase with Store {
  final FazerAlgo usecase;

  @observable
  List<EntidadeUm> list;

  @observable
  FailureNomeDoModulo error;

  @observable
  bool isLoading;

  _NomeStoreBase({
    @required this.usecase,
  }) {
    _init();
  }

  void _init() {
    list = [];
    //error = NoError();
    isLoading = false;
  }

  @action
  fetchData() async {
    isLoading = true;
    error = null;
    Either<FailureNomeDoModulo, List<EntidadeUm>> result =
        await usecase('teste');
    result.fold((l) {
      error = l;
    }, (r) {
      list = r;
    });
    isLoading = false;
  }
}
