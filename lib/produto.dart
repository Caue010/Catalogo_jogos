import 'package:flutter/material.dart';


class Produto {
  Produto({
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.quantidade,
    required this.icone,
  });

  final String nome;
  final String descricao;
  final double preco;
  final int quantidade;
  IconData icone;

  String get precoFormatado => 'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}';
}

final List<Produto> catalogo = [
  Produto(
    nome: 'Super Chicken Jumper',
    descricao:
        'Jogo em que você é um pintinho e precisa passar por diversas fases para salvar o mundo.',
    preco: 15.90,
    quantidade: 12,
    icone: Icons.hexagon,
  ),
  Produto(
    nome: 'Death Strading',
    descricao:
        'Jogo sobre entregar encomendas e reconectar os Estados Unidos da América em um mundo pós-apocaliptico.',
    preco: 140.50,
    quantidade: 5,
    icone: Icons.style,
  ),
  Produto(
    nome: 'Cyberpunk 2077',
    descricao:
        'Sobreviva em Night City, uma cidade distópica dominada pela técnologia e pelas mega corporações.',
    preco: 165.00,
    quantidade: 2,
    icone: Icons.castle,
  ),
  Produto(
    nome: 'Mole',
    descricao:
        'Jogo de terror sobre escavação, descubra o motivo de você estar nessa misteriosa e cruel escavação =.',
    preco: 40.90,
    quantidade: 8,
    icone: Icons.train,
  ),
  Produto(
    nome: 'Dead by Daylight',
    descricao:
        'Sobreviva com seus amigos nesse survivor multiplayer de terror com vários personagens icônicos do terror.',
    preco: 60.00,
    quantidade: 3,
    icone: Icons.flutter_dash,
  ),
  Produto(
    nome: 'Paladins',
    descricao:
        'Falam que é uma cópia de overwatch, mal sabem que é exatamente o contrario.',
    preco: 0.00,
    quantidade: 99,
    icone: Icons.diamond,
  ),
];
