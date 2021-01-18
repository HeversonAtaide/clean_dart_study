import 'package:clean_dart_study/app/modules/nome_do_modulo/infra/models/nome_do_model_model.dart';

abstract class NomeDoModuloDataSource {
  Future<List<EntidadeUmModel>> getAlgo(String parametroText);
}