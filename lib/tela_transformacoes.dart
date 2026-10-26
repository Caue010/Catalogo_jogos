import 'package:flutter/material.dart';

import 'registro_ciclo.dart';
import 'tema.dart';

class TelaTransformacoes extends StatefulWidget {
  const TelaTransformacoes({super.key, required this.registro});

  final RegistroCiclo registro;

  @override
  State<TelaTransformacoes> createState() => _TelaTransformacoesState();
}

class _TelaTransformacoesState extends State<TelaTransformacoes> {
  final List<int> _numeros = [1, 2, 3, 4, 5];
  final List<String> _palavras = ['Flutter', 'é', 'incrível'];
  final List<String> _nomes = ['Ana', 'Bruno', 'Carla'];

  String _mensagem = 'Nenhum botão pressionado ainda.';

  @override
  Widget build(BuildContext context) {
    final titulo = Theme.of(context).textTheme.titleMedium;

    // Transformação 1: cada int vira uma String.
    final comoTexto = _numeros.map((n) => n.toString()).toList();
    // Transformação 2: cada valor é multiplicado por 2.
    final dobrados = _numeros.map((n) => n * 2).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transformações'),
        foregroundColor: Colors.white,
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(gradient: gradienteAppBar),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Números', style: titulo),
            const SizedBox(height: 8),
            Text('Lista original: $_numeros'),
            Text('Lista de strings: $comoTexto'),
            Text('Valores multiplicados por 2: $dobrados'),
            const Divider(height: 32),
            Text('Palavras em widgets', style: titulo),
            const SizedBox(height: 8),
            // Cada palavra vira um widget Text.
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: _palavras
                  .map((p) => Text(p, style: const TextStyle(fontSize: 22)))
                  .toList(),
            ),
            const Divider(height: 32),
            Text('Nomes em botões', style: titulo),
            const SizedBox(height: 8),
            // Cada nome vira um botão que informa qual nome foi pressionado.
            Wrap(
              spacing: 8,
              children: _nomes
                  .map(
                    (nome) => FilledButton(
                      onPressed: () {
                        setState(() {
                          _mensagem = 'Você pressionou o botão: $nome';
                        });
                      },
                      child: Text(nome),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),
            Text(_mensagem),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Voltar ao catálogo'),
              ),
            ),
            const SizedBox(height: 16),
            HistoricoCiclo(registro: widget.registro),
          ],
        ),
      ),
    );
  }
}
