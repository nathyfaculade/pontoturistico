import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PontoTuristico {
  String nome;
  String descricao;
  String diferenciais;
  String dataInclusao;

  PontoTuristico(this.nome, this.descricao, this.diferenciais, this.dataInclusao);
}

class NovoPontoTuristicoScreen extends StatefulWidget {
  @override
  _NovoPontoTuristicoScreenState createState() => _NovoPontoTuristicoScreenState();
}

class _NovoPontoTuristicoScreenState extends State<NovoPontoTuristicoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _diferenciaisController = TextEditingController();
  String _dataInclusao = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Ponto Turístico'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite o nome do ponto turístico';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite a descrição do ponto turístico';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _diferenciaisController,
                decoration: InputDecoration(
                  labelText: 'Diferenciais',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite os diferenciais do ponto turístico';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      PontoTuristico novoPontoTuristico = PontoTuristico(
                        _nomeController.text,
                        _descricaoController.text,
                        _diferenciaisController.text,
                        _dataInclusao,
                      );
                      // aqui você pode salvar o novo ponto turístico no banco de dados ou em algum outro local
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
