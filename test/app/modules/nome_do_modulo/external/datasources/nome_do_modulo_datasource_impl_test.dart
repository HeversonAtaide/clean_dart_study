import 'dart:convert';

import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/external/datasources/nome_do_modulo_datasource_impl.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/infra/datasources/nome_do_modulo_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/algo_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  final datasource = NomeDoModuloDataSourceImpl(dio);

  test('deve retornar uma lista de EntidadeUmModel', () async {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(algoResult), statusCode: 200));

    final future = datasource.getAlgo('parametro');
    expect(future, completes);
  });

  test('deve retornar um DataSourceError se o código não for 200', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));

    final future = datasource.getAlgo('parametro');
    expect(future, throwsA(isA<DataSourceError>()));
  });

  test('deve retornar uma Exception se tiver um erro no dio', () async {
    when(dio.get(any))
        .thenThrow(Exception());

    final future = datasource.getAlgo('parametro');
    expect(future, throwsA(isA<Exception>()));
  });
}
