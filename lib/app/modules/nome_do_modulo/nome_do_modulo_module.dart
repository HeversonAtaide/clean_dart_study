import 'package:clean_dart_study/app/modules/nome_do_modulo/presenter/nome_do_modulo_controller.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/presenter/nome_do_modulo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NomeDoModuloModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => NomeDoModuloController()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => NomeDoModuloPage())
  ];

  static Inject get to => Inject<NomeDoModuloModule>.of();

  //Apagar se for ChildModule ao invés de WidgetModule
  @override
  Widget get view => NomeDoModuloPage();
}