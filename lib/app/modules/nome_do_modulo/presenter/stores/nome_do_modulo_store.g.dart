// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nome_do_modulo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NomeStore on _NomeStoreBase, Store {
  final _$listAtom = Atom(name: '_NomeStoreBase.list');

  @override
  List<EntidadeUm> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<EntidadeUm> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$errorAtom = Atom(name: '_NomeStoreBase.error');

  @override
  FailureNomeDoModulo get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(FailureNomeDoModulo value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NomeStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$fetchDataAsyncAction = AsyncAction('_NomeStoreBase.fetchData');

  @override
  Future fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
list: ${list},
error: ${error},
isLoading: ${isLoading}
    ''';
  }
}
