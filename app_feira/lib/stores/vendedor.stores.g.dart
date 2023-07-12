// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendedor.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VendedorStores on _VendedorStores, Store {
  late final _$obtemVendendorUserAsyncAction =
      AsyncAction('_VendedorStores.obtemVendendorUser', context: context);

  @override
  Future<bool> obtemVendendorUser(Map<String, dynamic> tokens) {
    return _$obtemVendendorUserAsyncAction
        .run(() => super.obtemVendendorUser(tokens));
  }

  late final _$editaVendedorAsyncAction =
      AsyncAction('_VendedorStores.editaVendedor', context: context);

  @override
  Future<bool> editaVendedor(
      String nome,
      DateTime? dataNascimento,
      String naturalidade,
      String linkWhatsapp,
      String email,
      Map<String, dynamic> tokens) {
    return _$editaVendedorAsyncAction.run(() => super.editaVendedor(
        nome, dataNascimento, naturalidade, linkWhatsapp, email, tokens));
  }

  late final _$apagarVendedorAsyncAction =
      AsyncAction('_VendedorStores.apagarVendedor', context: context);

  @override
  Future<bool> apagarVendedor(Map<String, dynamic> tokens) {
    return _$apagarVendedorAsyncAction.run(() => super.apagarVendedor(tokens));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
