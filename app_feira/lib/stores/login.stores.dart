// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


part 'login.stores.g.dart';


class LoginStores = _LoginStores with _$LoginStores;

abstract class _LoginStores with Store{

  String urlRoot = dotenv.get('API_URL_ROOT');

  @observable
  String mensagem = "";

  @observable
  bool clickBotao = false;

  @observable
  int idUserRedefineSenha = 0;

  @action
  void setaIdUserRedefineSenha(int value){
    idUserRedefineSenha = value;
  }

  @computed
  int get getIdUserRedefineSenha => idUserRedefineSenha;

  @action
  void setaClickBotao(bool value){
    clickBotao = value;
  }

  @observable/* Variável para definir se é um vendedor que está acessando o sistema ou um cliente */
  Map<String, String> vendedorApp = {};

  @action
  Future<bool> registraAppVendendor(String? value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(value != null){
      await prefs.setString('vendendorApp', value);
      return true;
    }
    return false;
  }

  @action
  Future<bool> obtemAppVendendor()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? aux = prefs.getString("vendendorApp");
    
    if(aux != null){
      vendedorApp['value'] = aux;
      return true;
    }
    return false;
  }

  @computed
  Map<String, String> get getVendedorApp => vendedorApp;

  /* Tokens */
  @observable
  Map <String, dynamic> tokens = {"access":"", "refresh":""};

  @computed
  Map<String, dynamic> get getTokens => tokens;
  /* Tokens */

  @action//Função que busca o token do vendedor para validar se o mesmo está logado
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens["access"] = prefs.getString('accessToken');
    tokens["refresh"] = prefs.getString('refreshToken');  
    
    if (tokens["access"] != null && tokens["access"].toString().isNotEmpty){
      return true;
    }
    return false;
  }

  @action
  Future<void> salvaTokens(String? access, String? refresh) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (access != null){
      await prefs.setString('accessToken', access);
    }
    if (refresh != null){
      await prefs.setString('refreshToken', refresh);
    }    
  }

  @action//Apgando tokens, função chamada para logout do usuário
  Future<bool> apagaTokens()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    tokens.clear();
    return true;
  }

  /* Faz login do usuário */
  @action
  Future<bool> loginFunction(String email, String senha)async{
    if (email.isEmpty || senha.isEmpty){
      mensagem = "Os campos de login não podem ser vazios!";
      return false;
    }
    String url = "$urlRoot/api/token/";
    var body = {"email":email, "password":senha};
    try{
      http.Response response = await http.post(Uri.parse(url), body: body);
      if(response.statusCode == 200){
        var responseData = json.decode(utf8.decode(response.bodyBytes));
        await salvaTokens(responseData["access"], responseData["refresh"]);
        return true;
      }else if (response.statusCode == 401){
        mensagem = "Credenciais erradas!";
        return false;
      }else{
        mensagem = "Algo deu errado, tente novamente!";
        return false;
      }
    }catch(e){
      mensagem = "Verifique sua conexão e tente novamente!";
      return false;
    }
  }

  @action
  Future<bool>mudaSenha(String senhaAntiga, String senha, String senhaConfirma, Map<String, dynamic> tokens)async{
    if(senhaAntiga.isEmpty || senha.isEmpty || senhaConfirma.isEmpty){
      mensagem = "Nenhum dos campos pode ser vazio!";
      return false;
    }
    String url = "$urlRoot/muda-senha/";
    Map<String, dynamic> dados = {
      "old_password": senhaAntiga, 
      "password": senha,
      "password2": senhaConfirma
    };

    try{
      http.Response response = await http.put(
        Uri.parse(url), headers: {"Authorization": "Bearer ${tokens['access']}"},
        body: dados
      );

      if(response.statusCode == 200){
        mensagem = "Senha alterada com sucesso!";
        return true;
      }else{
        var responseData = json.decode(utf8.decode(response.bodyBytes));
        try{
          mensagem = responseData["old_password"]["old_password"];
        }on NoSuchMethodError{
          mensagem = responseData['password'][0];
        }catch (e){
          mensagem = "Algo deu errado!";
        }
        return false;
      }
    }catch(e){
      mensagem = "Algo deu errado, verifique sua conexão e tente novamente!";
      return false;
    }
  }

  @action
  Future<bool> buscaUserPeloEmail(String email, String whatsapp) async{
    if(email.isEmpty || whatsapp.isEmpty){
      mensagem = "Os campos não podem ser vazios!";
      return false;
    }

    String url = "$urlRoot/obtem-user-email/";
    Map<String, dynamic> dados = {
      "email": email, 
      "whatsapp": whatsapp
    };

    try{
      http.Response response = await http.post(Uri.parse(url), body: dados);
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      if(response.statusCode == 200){
        mensagem = "Redefina sua senha!";
        setaIdUserRedefineSenha(responseData['id']);
        return true;
      }else if(response.statusCode == 400){
        try{
          mensagem = responseData["email"][0];
        }catch(e){
          mensagem = "Verifique os dados e tente novamente!";
        }
      }else if(response.statusCode == 404){
        mensagem = responseData["error"];
      }else{
        mensagem = "Algo deu errado, verifique os dados e a sua conexão e tente novamente!";
      }
      return false;
    }catch(e){
      mensagem = "Algo deu errado, verifique os dados e a sua conexão e tente novamente!";
      return false;
    }
  }

  @action
  Future<bool> refefineSenhaUser(String senha, String confirmaSenha, int idUSer)async{
    if(senha.isEmpty || confirmaSenha.isEmpty){
      mensagem = "As senhas não podem ser vazias e nem diferentes";
      return false;
    }

    String url = "$urlRoot/redefine-senha/";
    Map<String, dynamic> dados = {
      "id": idUSer.toString(),
      "nova_senha": senha,
      "confirma_senha": confirmaSenha
    };

    try{
      http.Response response = await http.post(Uri.parse(url), body: dados);
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200){
        mensagem = responseData["detail"];
        return true;
      }else if(response.statusCode == 400){
        mensagem = responseData["detail"];
        return false;
      }else{
        mensagem = "Algo deu errado, verifique os dados e sua conexão e tente novamente!";
        return false;
      }
    }catch(e){
      mensagem = "Algo deu errado, verifique os dados e sua conexão e tente novamente!";
      return false;
    }
    
  }

}