import 'package:flutter/material.dart';

class PagesCadastro extends StatefulWidget {
  @override
  _PagesCadastroState createState() => _PagesCadastroState();
}

class _PagesCadastroState extends State<PagesCadastro> {
  final _formKey = GlobalKey<FormState>();

  String _nome = '';
  String _endereco = '';
  String _descricao = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Ponto Turístico'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nome = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _endereco = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _descricao = value!;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Salva os valores do formulário
                        _formKey.currentState!.save();

                        // Cria um novo objeto Sight com as informações do formulário
                        Sight novoSight = Sight(
                          name: _nome,
                          location: _endereco,
                          description: _descricao,
                          imageUrl: 'https://www.example.com/image.jpg',
                        );

                        // Retorna à tela anterior
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
      ),
    );
  }
}

class Sight {
  final String name;
  final String location;
  final String description;
  final String imageUrl;

  Sight({required this.name,required this.location,required this.description,required this.imageUrl});
}
