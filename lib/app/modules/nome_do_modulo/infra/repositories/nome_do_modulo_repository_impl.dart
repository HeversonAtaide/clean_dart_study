import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/repositories/nome_do_modulo_repository.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/infra/datasources/nome_do_modulo_datasource.dart';
import 'package:dartz/dartz.dart';

class NomeDoModuloRepositoryImpl implements NomeDoModuloRepository {
  final NomeDoModuloDataSource datasource;

  NomeDoModuloRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureNomeDoModulo, List<EntidadeUm>>> nomeDoModulo(
      String parametroText) async {
    
    try {
    final result = await datasource.getAlgo(parametroText);
    return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
