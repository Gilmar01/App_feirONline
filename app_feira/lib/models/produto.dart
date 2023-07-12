

import 'package:app_feira/models/vendedor.dart';

class Produto{

  int id;
  String nome;
  String preco;
  int quantidade;
  String imagem;
  VendedorProduto vendedor;

  Produto({
    required this.id, required this.nome, 
    required this.preco,
    required this.quantidade,
    required this.imagem,
    required this.vendedor,
  });
  
  Produto.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    nome = json["nome"],
    preco = json['preco'],
    quantidade = json['quantidade'],
    imagem = json['imagem'],
    vendedor = json['vendedor']
    ;

}

class ProdutoVendedor{

  int id;
  String nome;
  String preco;
  int quantidade;
  String descricao;
  String imagem;
  int vendedorID;

  ProdutoVendedor({
    required this.id, required this.nome, 
    required this.preco,
    required this.quantidade,
    required this.descricao,
    required this.imagem,
    required this.vendedorID,
  });
  
  ProdutoVendedor.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    nome = json["nome"],
    preco = json['preco'],
    quantidade = json['quantidade'],
    descricao = json['descricao'],
    imagem = json['imagem'],
    vendedorID = json['vendedor']
    ;

}