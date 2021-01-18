import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/repositories/nome_do_modulo_repository.dart';
import 'package:dartz/dartz.dart';

abstract class FazerAlgo {
  Future<Either<FailureNomeDoModulo, List<EntidadeUm>>> call(String parametroText);
}

class FazerAlgoImpl implements FazerAlgo {

  final NomeDoModuloRepository repository;

  FazerAlgoImpl(this.repository);

  @override
  Future<Either<FailureNomeDoModulo, List<EntidadeUm>>> call(String parametroText) async {

    if(parametroText == null || parametroText.isEmpty){
      return Left(InvalidTextError());
    }

    return repository.nomeDoModulo(parametroText);
  }
}
