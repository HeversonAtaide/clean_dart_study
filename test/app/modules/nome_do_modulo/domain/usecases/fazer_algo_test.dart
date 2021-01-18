import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/repositories/nome_do_modulo_repository.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/usecases/fazer_algo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class NomeDoModuloMock extends Mock implements NomeDoModuloRepository {}

main() {
  final repository = NomeDoModuloMock();

  final usecase = FazerAlgoImpl(repository);

  test('deve retornar um exception caso o texto seja inválido', () async {
    when(repository.nomeDoModulo(any))
        .thenAnswer((realInvocation) async => Right(<EntidadeUm>[]));

    var result = await usecase(null);
    expect(result.isLeft(), true); // não precisa desse 
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });

  test('deve retornar uma lista de EntidadeUm', () async {
    when(repository.nomeDoModulo(any))
        .thenAnswer((realInvocation) async => Right(<EntidadeUm>[]));

    final result = await usecase('parametro');
    // expect(result, isA<Right>());
    // expect(result.getOrElse(() => null), isA<List<EntidadeUm>>());
    expect(result | null,
        isA<List<EntidadeUm>>()); // ou vai ser o lado direito, ou vai ser nulo
  });
}
