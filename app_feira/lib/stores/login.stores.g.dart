// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStores on _LoginStores, Store {
  Computed<int>? _$getIdUserRedefineSenhaComputed;

  @override
  int get getIdUserRedefineSenha => (_$getIdUserRedefineSenhaComputed ??=
          Computed<int>(() => super.getIdUserRedefineSenha,
              name: '_LoginStores.getIdUserRedefineSenha'))
      .value;
  Computed<Map<String, String>>? _$getVendedorAppComputed;

  @override
  Map<String, String> get getVendedorApp => (_$getVendedorAppComputed ??=
          Computed<Map<String, String>>(() => super.getVendedorApp,
              name: '_LoginStores.getVendedorApp'))
      .value;
  Computed<Map<String, dynamic>>? _$getTokensComputed;

  @override
  Map<String, dynamic> get getTokens => (_$getTokensComputed ??=
          Computed<Map<String, dynamic>>(() => super.getTokens,
              name: '_LoginStores.getTokens'))
      .value;

  late final _$mensagemAtom =
      Atom(name: '_LoginStores.mensagem', context: context);

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

  late final _$clickBotaoAtom =
      Atom(name: '_LoginStores.clickBotao', context: context);

  @override
  bool get clickBotao {
    _$clickBotaoAtom.reportRead();
    return super.clickBotao;
  }

  @override
  set clickBotao(bool value) {
    _$clickBotaoAtom.reportWrite(value, super.clickBotao, () {
      super.clickBotao = value;
    });
  }

  late final _$idUserRedefineSenhaAtom =
      Atom(name: '_LoginStores.idUserRedefineSenha', context: context);

  @override
  int get idUserRedefineSenha {
    _$idUserRedefineSenhaAtom.reportRead();
    return super.idUserRedefineSenha;
  }

  @override
  set idUserRedefineSenha(int value) {
    _$idUserRedefineSenhaAtom.reportWrite(value, super.idUserRedefineSenha, () {
      super.idUserRedefineSenha = value;
    });
  }

  late final _$vendedorAppAtom =
      Atom(name: '_LoginStores.vendedorApp', context: context);

  @override
  Map<String, String> get vendedorApp {
    _$vendedorAppAtom.reportRead();
    return super.vendedorApp;
  }

  @override
  set vendedorApp(Map<String, String> value) {
    _$vendedorAppAtom.reportWrite(value, super.vendedorApp, () {
      super.vendedorApp = value;
    });
  }

  late final _$tokensAtom = Atom(name: '_LoginStores.tokens', context: context);

  @override
  Map<String, dynamic> get tokens {
    _$tokensAtom.reportRead();
    return super.tokens;
  }

  @override
  set tokens(Map<String, dynamic> value) {
    _$tokensAtom.reportWrite(value, super.tokens, () {
      super.tokens = value;
    });
  }

  late final _$registraAppVendendorAsyncAction =
      AsyncAction('_LoginStores.registraAppVendendor', context: context);

  @override
  Future<bool> registraAppVendendor(String? value) {
    return _$registraAppVendendorAsyncAction
        .run(() => super.registraAppVendendor(value));
  }

  late final _$obtemAppVendendorAsyncAction =
      AsyncAction('_LoginStores.obtemAppVendendor', context: context);

  @override
  Future<bool> obtemAppVendendor() {
    return _$obtemAppVendendorAsyncAction.run(() => super.obtemAppVendendor());
  }

  late final _$checkLoginAsyncAction =
      AsyncAction('_LoginStores.checkLogin', context: context);

  @override
  Future<bool> checkLogin() {
    return _$checkLoginAsyncAction.run(() => super.checkLogin());
  }

  late final _$salvaTokensAsyncAction =
      AsyncAction('_LoginStores.salvaTokens', context: context);

  @override
  Future<void> salvaTokens(String? access, String? refresh) {
    return _$salvaTokensAsyncAction
        .run(() => super.salvaTokens(access, refresh));
  }

  late final _$apagaTokensAsyncAction =
      AsyncAction('_LoginStores.apagaTokens', context: context);

  @override
  Future<bool> apagaTokens() {
    return _$apagaTokensAsyncAction.run(() => super.apagaTokens());
  }

  late final _$loginFunctionAsyncAction =
      AsyncAction('_LoginStores.loginFunction', context: context);

  @override
  Future<bool> loginFunction(String email, String senha) {
    return _$loginFunctionAsyncAction
        .run(() => super.loginFunction(email, senha));
  }

  late final _$mudaSenhaAsyncAction =
      AsyncAction('_LoginStores.mudaSenha', context: context);

  @override
  Future<bool> mudaSenha(String senhaAntiga, String senha, String senhaConfirma,
      Map<String, dynamic> tokens) {
    return _$mudaSenhaAsyncAction
        .run(() => super.mudaSenha(senhaAntiga, senha, senhaConfirma, tokens));
  }

  late final _$buscaUserPeloEmailAsyncAction =
      AsyncAction('_LoginStores.buscaUserPeloEmail', context: context);

  @override
  Future<bool> buscaUserPeloEmail(String email, String whatsapp) {
    return _$buscaUserPeloEmailAsyncAction
        .run(() => super.buscaUserPeloEmail(email, whatsapp));
  }

  late final _$refefineSenhaUserAsyncAction =
      AsyncAction('_LoginStores.refefineSenhaUser', context: context);

  @override
  Future<bool> refefineSenhaUser(
      String senha, String confirmaSenha, int idUSer) {
    return _$refefineSenhaUserAsyncAction
        .run(() => super.refefineSenhaUser(senha, confirmaSenha, idUSer));
  }

  late final _$_LoginStoresActionController =
      ActionController(name: '_LoginStores', context: context);

  @override
  void setaIdUserRedefineSenha(int value) {
    final _$actionInfo = _$_LoginStoresActionController.startAction(
        name: '_LoginStores.setaIdUserRedefineSenha');
    try {
      return super.setaIdUserRedefineSenha(value);
    } finally {
      _$_LoginStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setaClickBotao(bool value) {
    final _$actionInfo = _$_LoginStoresActionController.startAction(
        name: '_LoginStores.setaClickBotao');
    try {
      return super.setaClickBotao(value);
    } finally {
      _$_LoginStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mensagem: ${mensagem},
clickBotao: ${clickBotao},
idUserRedefineSenha: ${idUserRedefineSenha},
vendedorApp: ${vendedorApp},
tokens: ${tokens},
getIdUserRedefineSenha: ${getIdUserRedefineSenha},
getVendedorApp: ${getVendedorApp},
getTokens: ${getTokens}
    ''';
  }
}
