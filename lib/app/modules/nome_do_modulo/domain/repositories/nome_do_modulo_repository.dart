import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class NomeDoModuloRepository{
  Future<Either<FailureNomeDoModulo, List<EntidadeUm>>> nomeDoModulo(String parametroText);
}