import 'package:flutter/material.dart';

import 'produto.dart';
import 'registro_ciclo.dart';
import 'tema.dart';
import 'tela_detalhes.dart';
import 'tela_transformacoes.dart';

class TelaCatalogo extends StatelessWidget {
  const TelaCatalogo({super.key, required this.registro});

  final RegistroCiclo registro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Jogos'),
        foregroundColor: Colors.white,
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(gradient: gradienteAppBar),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...catalogo
                .map((produto) => CardProduto(produto: produto, registro: registro))
                .toList(),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              icon: const Icon(Icons.transform),
              label: const Text('Transformações'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TelaTransformacoes(registro: registro),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            HistoricoCiclo(registro: registro),
          ],
        ),
      ),
    );
  }
}

class CardProduto extends StatelessWidget {
  const CardProduto({super.key, required this.produto, required this.registro});

  final Produto produto;
  final RegistroCiclo registro;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              width: 84,
              height: 84,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [azul, roxo],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(produto.icone, size: 44, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        color: produto.quantidade == 0 ? Colors.red : Colors.green.shade700,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${produto.quantidade}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(produto.nome, style: Theme.of(context).textTheme.titleMedium),
                  Text(produto.precoFormatado),
                  const SizedBox(height: 8),
                  FilledButton.tonal(
                    // O produto do card é capturado aqui e enviado à tela de detalhes.
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              TelaDetalhes(produto: produto, registro: registro),
                        ),
                      );
                    },
                    child: const Text('Detalhes'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
