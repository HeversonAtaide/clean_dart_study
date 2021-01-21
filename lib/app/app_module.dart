import 'package:clean_dart_study/app/modules/nome_do_modulo/presenter/nome_do_modulo_controller.dart';
import 'package:dio/dio.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:clean_dart_study/app/app_widget.dart';
import 'package:clean_dart_study/app/modules/home/home_module.dart';

import 'modules/nome_do_modulo/domain/usecases/fazer_algo.dart';
import 'modules/nome_do_modulo/external/datasources/nome_do_modulo_datasource_impl.dart';
import 'modules/nome_do_modulo/infra/repositories/nome_do_modulo_repository_impl.dart';
import 'modules/nome_do_modulo/nome_do_modulo_module.dart';
import 'modules/nome_do_modulo/presenter/stores/nome_do_modulo_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,

        // Others
        Bind((i) => Dio()),

        // Datasourcers
        Bind((i) => NomeDoModuloDataSourceImpl(i())),

        // Repositories
        Bind((i) => NomeDoModuloRepositoryImpl(i())),

        // Usecases
        Bind((i) => FazerAlgoImpl(i())),

        // Controllers
        Bind((i) => NomeDoModuloController(nomeStore: i())),

        // Stores
        Bind((i) => NomeStore(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: NomeDoModuloModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
