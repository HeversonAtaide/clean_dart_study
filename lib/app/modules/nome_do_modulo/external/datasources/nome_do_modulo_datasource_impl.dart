import 'package:dio/dio.dart';

import '../../infra/datasources/nome_do_modulo_datasource.dart';
import '../../infra/models/nome_do_model_model.dart';

class NomeDoModuloDataSourceImpl implements NomeDoModuloDataSource {
  final Dio dio;

  NomeDoModuloDataSourceImpl(this.dio);

  @override
  Future<List<EntidadeUmModel>> getAlgo(String parametroText) async {
    await Future.delayed(Duration(seconds: 5), () {});
    List<EntidadeUmModel> list = <EntidadeUmModel>[];
    list = [
      EntidadeUmModel(atributoUm: '1', atributoDois: '2', atributotres: '3'),
      EntidadeUmModel(atributoUm: '4', atributoDois: '5', atributotres: '6'),
      EntidadeUmModel(atributoUm: '7', atributoDois: '8', atributotres: '9')
    ];
    return list;
    // final response = await dio.get('https://$parametroText');
    // if (response.statusCode == 200) {
    //   final list = (response.data['items'] as List)
    //       .map((e) => EntidadeUmModel.fromMap(e))
    //       .toList();

    //   return list;
    // } else {
    //   throw DataSourceError();
    // }
  }
}
