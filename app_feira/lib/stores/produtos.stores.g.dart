// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutosStores on _ProdutosStores, Store {
  late final _$mensagemAtom =
      Atom(name: '_ProdutosStores.mensagem', context: context);

  @override
  String get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(String value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  late final _$listaDeProdutosAtom =
      Atom(name: '_ProdutosStores.listaDeProdutos', context: context);

  @override
  List<ProdutoVendedor> get listaDeProdutos {
    _$listaDeProdutosAtom.reportRead();
    return super.listaDeProdutos;
  }

  @override
  set listaDeProdutos(List<ProdutoVendedor> value) {
    _$listaDeProdutosAtom.reportWrite(value, super.listaDeProdutos, () {
      super.listaDeProdutos = value;
    });
  }

  late final _$listaProdutosAtom =
      Atom(name: '_ProdutosStores.listaProdutos', context: context);

  @override
  List<Produto> get listaProdutos {
    _$listaProdutosAtom.reportRead();
    return super.listaProdutos;
  }

  @override
  set listaProdutos(List<Produto> value) {
    _$listaProdutosAtom.reportWrite(value, super.listaProdutos, () {
      super.listaProdutos = value;
    });
  }

  late final _$produtoSelecionadoAtom =
      Atom(name: '_ProdutosStores.produtoSelecionado', context: context);

  @override
  ProdutoVendedor? get produtoSelecionado {
    _$produtoSelecionadoAtom.reportRead();
    return super.produtoSelecionado;
  }

  @override
  set produtoSelecionado(ProdutoVendedor? value) {
    _$produtoSelecionadoAtom.reportWrite(value, super.produtoSelecionado, () {
      super.produtoSelecionado = value;
    });
  }

  late final _$listaProdutosAtualizadaAtom =
      Atom(name: '_ProdutosStores.listaProdutosAtualizada', context: context);

  @override
  bool get listaProdutosAtualizada {
    _$listaProdutosAtualizadaAtom.reportRead();
    return super.listaProdutosAtualizada;
  }

  @override
  set listaProdutosAtualizada(bool value) {
    _$listaProdutosAtualizadaAtom
        .reportWrite(value, super.listaProdutosAtualizada, () {
      super.listaProdutosAtualizada = value;
    });
  }

  late final _$cadastraProdutoAsyncAction =
      AsyncAction('_ProdutosStores.cadastraProduto', context: context);

  @override
  Future<bool> cadastraProduto(
      Map<String, dynamic> dados, Map<String, dynamic> tokens) {
    return _$cadastraProdutoAsyncAction
        .run(() => super.cadastraProduto(dados, tokens));
  }

  late final _$editaProdutoAsyncAction =
      AsyncAction('_ProdutosStores.editaProduto', context: context);

  @override
  Future<bool> editaProduto(
      Map<String, dynamic> dados, Map<String, dynamic> tokens) {
    return _$editaProdutoAsyncAction
        .run(() => super.editaProduto(dados, tokens));
  }

  late final _$_ProdutosStoresActionController =
      ActionController(name: '_ProdutosStores', context: context);

  @override
  void selecionaProduto(ProdutoVendedor produtoVendendor) {
    final _$actionInfo = _$_ProdutosStoresActionController.startAction(
        name: '_ProdutosStores.selecionaProduto');
    try {
      return super.selecionaProduto(produtoVendendor);
    } finally {
      _$_ProdutosStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setaStatusListaProdutos(bool value) {
    final _$actionInfo = _$_ProdutosStoresActionController.startAction(
        name: '_ProdutosStores.setaStatusListaProdutos');
    try {
      return super.setaStatusListaProdutos(value);
    } finally {
      _$_ProdutosStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mensagem: ${mensagem},
listaDeProdutos: ${listaDeProdutos},
listaProdutos: ${listaProdutos},
produtoSelecionado: ${produtoSelecionado},
listaProdutosAtualizada: ${listaProdutosAtualizada}
    ''';
  }
}
