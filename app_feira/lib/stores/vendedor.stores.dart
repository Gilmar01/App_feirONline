// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:app_feira/models/vendedor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;


part 'vendedor.stores.g.dart';


class VendedorStores = _VendedorStores with _$VendedorStores;

abstract class _VendedorStores with Store{

  String urlRoot = dotenv.get('API_URL_ROOT');

  String mensagem = "";

  Vendedor? vendedor;

  @action
  Future<bool> obtemVendendorUser(Map<String, dynamic> tokens)async{
    
    String url = "$urlRoot/user-info/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};
    
    try{
      http.Response response = await http.get(Uri.parse(url),headers: headers);
      
      if (response.statusCode == 200){
        var responseData = json.decode(utf8.decode(response.bodyBytes));

        vendedor = Vendedor(
          id: responseData['id'], 
          nome: responseData['nome'], 
          naturalidade: responseData['naturalidade'], 
          dataNascimento: DateTime.parse(responseData["data_nascimento"]),
          linkWhatsapp: responseData['whatsapp'],
          email: responseData['email']
        );
      } else if (response.statusCode == 404){
        mensagem = "Nenhum vendedor com esse email foi encontrado no sistema";
      }
    }catch(e){
      mensagem = "Algo deu errado, tente fazer login novamente";
    }
    return vendedor?.nome != null ? true : false;
  }


  Future<bool> cadastrarVendedor(String nome, DateTime? dataNascimento, String naturalidade, String linkWhatsapp, String email, String senha, String confirmaSenha) async{
    
    if(senha != confirmaSenha || (senha.isEmpty || confirmaSenha.isEmpty || dataNascimento == null)){
      mensagem = 'Senhas diferentes';
      return false;
    }

    if (nome.isEmpty || naturalidade.isEmpty || linkWhatsapp.isEmpty || email.isEmpty){
      mensagem = "Preencha todos os campos para realizar o cadastro";
      return false;
    }

    String url = "$urlRoot/user-create/";

    Map<String, dynamic> dados = {
      "nome": nome,
      "data_nascimento": "${dataNascimento.year}-${dataNascimento.month}-${dataNascimento.day}",
      "naturalidade": naturalidade,
      "whatsapp": linkWhatsapp,
      "email": email,
      "password": senha
    };
    
    var body = json.encode(dados);

    try{
      http.Response response = await http.post(
        Uri.parse(url), headers: {"Content-Type": "application/json"},body: body
      );
      if (response.statusCode == 201){
        mensagem = "Cadastro realizado com sucesso, faça seu login";
        return true;
      }else if(response.statusCode == 400){
        var responseData = json.decode(utf8.decode(response.bodyBytes));
        mensagem = responseData['email'][0];
        return false;
      }else{
        mensagem = "Algo deu errado, reveja os dados e tente novamente";
        return false;
      }
    }catch (e){
      mensagem = "Algo deu errado, reveja os dados e tente novamente!";
      return false;
    }

  }

  @action
  Future<bool> editaVendedor(String nome, DateTime? dataNascimento, String naturalidade, String linkWhatsapp, String email, Map<String, dynamic> tokens)async{
    
    if (nome.isEmpty || naturalidade.isEmpty || linkWhatsapp.isEmpty || email.isEmpty){
      mensagem = "Preencha todos os campos para realizar o cadastro";
      return false;
    }

    String url = "$urlRoot/user-update/";

    Map<String, dynamic> dados = {
      "nome": nome,
      "data_nascimento": "${dataNascimento!.year}-${dataNascimento.month}-${dataNascimento.day}",
      "naturalidade": naturalidade,
      "whatsapp": linkWhatsapp,
      "email": email,
    }; 

    var body = json.encode(dados);
    try{
      http.Response response = await http.patch(
      Uri.parse(url), headers: {
        "Content-Type": "application/json", "Authorization": "Bearer ${tokens['access']}"
        }, body: body
      );
      if (response.statusCode == 200){
        var responseData = json.decode(utf8.decode(response.bodyBytes));

        vendedor = Vendedor(
          id: responseData['id'], 
          nome: responseData['nome'], 
          naturalidade: responseData['naturalidade'], 
          dataNascimento: DateTime.parse(responseData["data_nascimento"]),
          linkWhatsapp: responseData['whatsapp'],
          email: responseData['email']
        );
        return true;
      } else if(response.statusCode == 400){
        var responseData = json.decode(utf8.decode(response.bodyBytes));
        try{
          mensagem = responseData['email'][0];
        }catch (e){
          mensagem = "Algo deu errado, confira os dados e tente novamente!";
        }
        return false;
      }else{
        mensagem = "Algo deu errado, confira os dados e tente novamente!";
        return false;
      }
    }catch(e){
      mensagem = "Algo deu errado, confira os dados e tente novamente!";
      return false;
    }
  }

  @action
  Future<bool> apagarVendedor(Map<String, dynamic> tokens) async{
    
    String url = "$urlRoot/user-delete/"; 
    var headers={"Authorization": "Bearer ${tokens['access']}"};

    try{
      http.Response response = await http.delete(Uri.parse(url),headers: headers);
      if (response.statusCode == 204){
        mensagem = "Conta apagada com sucesso!";
        return true;
      }else{
        mensagem = "Algo deu errado, verifique sua conexão e tente novamente!";
        return false;
      }
    } catch (e){
      mensagem = "Algo deu errado, verifique sua conexão e tente novamente!";
      return false;
    }
  }

}