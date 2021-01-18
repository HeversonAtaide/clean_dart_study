import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/infra/datasources/nome_do_modulo_datasource.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/infra/models/nome_do_model_model.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/infra/repositories/nome_do_modulo_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class NomeDoModuloDataSourceMock extends Mock
    implements NomeDoModuloDataSource {}

main() {
  final datasource = NomeDoModuloDataSourceMock();

  final NomeDoModuloRepositoryImpl repositoryImpl =
      NomeDoModuloRepositoryImpl(datasource);

  test('deve retornar uma lista de EntidadeUm', () async {
    when(datasource.getAlgo(any)).thenAnswer((_) async {
      return <EntidadeUmModel>[];
    });

    final result = await repositoryImpl.nomeDoModulo('test');
    expect(result | null, isA<List<EntidadeUm>>());
  });

  test('deve retornar um error se o datasource falhar', () async {
    when(datasource.getAlgo(any)).thenThrow(Exception());

    final result = await repositoryImpl.nomeDoModulo('test');
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
