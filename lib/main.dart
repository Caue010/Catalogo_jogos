import 'package:flutter/material.dart';

import 'registro_ciclo.dart';
import 'tela_catalogo.dart';
import 'tema.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> with WidgetsBindingObserver {
  final RegistroCiclo _registro = RegistroCiclo();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final inicial = WidgetsBinding.instance.lifecycleState;
    _registro.adicionar(
        'Estado lido ao iniciar: ${inicial?.name ?? 'ainda não informado'}');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _registro.adicionar(state.name);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _registro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Jogos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: azul).copyWith(
          primary: azul,
          secondary: roxo,
          tertiary: roxo,
        ),
        useMaterial3: true,
      ),
      home: TelaCatalogo(registro: _registro),
    );
  }
}
