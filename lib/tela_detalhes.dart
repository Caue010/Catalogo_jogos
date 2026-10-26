import 'package:flutter/material.dart';

import 'produto.dart';
import 'registro_ciclo.dart';
import 'tema.dart';

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key, required this.produto, required this.registro});

  final Produto produto;
  final RegistroCiclo registro;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        foregroundColor: Colors.white,
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(gradient: gradienteAppBar),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Icon(produto.icone, size: 72, color: roxo)),
              const SizedBox(height: 16),
              Text('Nome: ${produto.nome}', style: texto.titleLarge),
              const SizedBox(height: 8),
              Text('Descrição: ${produto.descricao}'),
              const SizedBox(height: 8),
              Text('Preço: ${produto.precoFormatado}'),
              const SizedBox(height: 8),
              Text('Quantidade disponível: ${produto.quantidade}'),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Voltar ao catálogo'),
                ),
              ),
              const SizedBox(height: 16),
              HistoricoCiclo(registro: registro),
            ],
          ),
        ),
      ),
    );
  }
}
