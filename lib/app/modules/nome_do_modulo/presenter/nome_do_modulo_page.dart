import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/entities/entidade_um.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/domain/errors/errors.dart';
import 'package:clean_dart_study/app/modules/nome_do_modulo/presenter/nome_do_modulo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';

class NomeDoModuloPage extends StatefulWidget {
  final String title;
  const NomeDoModuloPage({Key key, this.title = "NomeDoModuloPage"})
      : super(key: key);

  @override
  _NomeDoModuloPageState createState() => _NomeDoModuloPageState();
}

class _NomeDoModuloPageState
    extends ModularState<NomeDoModuloPage, NomeDoModuloController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return controller.nomeStore.isLoading
              ? _buildLoading()
              : controller.nomeStore.error != null
                  ? _buildError(controller.nomeStore.error)
                  : controller.nomeStore.list.isEmpty
                      ? _buildEmpty()
                      : _buildContent(controller.nomeStore.list);
        },
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
        child: RaisedButton(
      onPressed: () {
        controller.buttonClick();
      },
      child: Text(
        'Empty',
        style: TextStyle(color: Colors.white),
      ),
    ));
  }

  Widget _buildLoading() {
    return Center(
      child: Expanded(
        child: SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Text(
              'Shimmer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(List<EntidadeUm> list) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              var item = list[index];
              return ListTile(
                title: Text('index $index, atributotres ${item.atributotres}.'),
              );
            },
          ),
        ),
        Center(
            child: RaisedButton(
                child: Text('Buscar de novo'),
                onPressed: () {
                  controller.nomeStore.fetchData();
                }))
      ],
    );
  }

  Widget _buildError(FailureNomeDoModulo error) {
    if (error is InvalidTextError) {
      return Center(
        child: Text('InvalidTextError'),
      );
    } else if (error is DataSourceError) {
      return Center(child: Text('DataSourceError'));
    } else {
      return (Center(child: Text('Error desconhecido')));
    }
  }
}
