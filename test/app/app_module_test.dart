import 'dart:convert';

import 'package:clean_dart_study/app/app_module.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/usecases/fazer_algo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'modules/nome_do_modulo/utils/algo_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);
  test('deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<FazerAlgo>();
    expect(usecase, isA<FazerAlgoImpl>());
  });

  test('deve retornar uma lista de EntidadeUm', () async {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(algoResult), statusCode: 200));

    final usecase = Modular.get<FazerAlgo>();
    var result = await usecase.call('teste');
    expect(result | null, isA<List<EntidadeUm>>());
  });
}
