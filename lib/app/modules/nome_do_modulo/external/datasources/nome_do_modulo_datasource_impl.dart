import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/infra/datasources/nome_do_modulo_datasource.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/infra/models/nome_do_model_model.dart';
import 'package:dio/dio.dart';

class NomeDoModuloDataSourceImpl implements NomeDoModuloDataSource {
  final Dio dio;

  NomeDoModuloDataSourceImpl(this.dio);

  @override
  Future<List<EntidadeUmModel>> getAlgo(String parametroText) async {
    final response = await dio.get('url$parametroText');
    if(response.statusCode == 200 ){
      final list = (response.data['items'] as List).map((e) => EntidadeUmModel.fromMap(e)).toList();
      
      return list;  
    }else{
      throw DataSourceError();
    }
  }
}
