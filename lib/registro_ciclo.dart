import 'package:flutter/material.dart';

/// Guarda, na ordem em que ocorreram, os estados de ciclo de vida recebidos.
/// Fica no widget raiz para continuar disponível ao navegar entre telas.
class RegistroCiclo extends ValueNotifier<List<String>> {
  RegistroCiclo() : super(<String>[]);

  void adicionar(String estado) {
    final agora = DateTime.now();
    String doisDigitos(int n) => n.toString().padLeft(2, '0');
    final hora =
        '${doisDigitos(agora.hour)}:${doisDigitos(agora.minute)}:${doisDigitos(agora.second)}';
    value = [...value, '$hora - $estado'];
  }
}

/// Exibe o histórico na interface (atualiza sozinho quando o registro muda).
class HistoricoCiclo extends StatelessWidget {
  const HistoricoCiclo({super.key, required this.registro});

  final RegistroCiclo registro;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Histórico do ciclo de vida',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ValueListenableBuilder<List<String>>(
              valueListenable: registro,
              builder: (context, lista, _) {
                if (lista.isEmpty) {
                  return const Text('Nenhum estado registrado ainda.');
                }
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 180),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < lista.length; i++)
                          Text('${i + 1}. ${lista[i]}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
