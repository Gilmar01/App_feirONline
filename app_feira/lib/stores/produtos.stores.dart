// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:app_feira/models/produto.dart';
import 'package:app_feira/models/vendedor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;


part 'produtos.stores.g.dart';


class ProdutosStores = _ProdutosStores with _$ProdutosStores;

abstract class _ProdutosStores with Store{

  String urlRoot = dotenv.get('API_URL_ROOT');

  @observable
  String mensagem = "";

  @observable
  List<ProdutoVendedor> listaDeProdutos = [];

  @observable
  List<Produto> listaProdutos = [];

  @observable
  ProdutoVendedor? produtoSelecionado;

  @observable
  bool listaProdutosAtualizada = false;

  @action
  void selecionaProduto(ProdutoVendedor produtoVendendor){
    produtoSelecionado = produtoVendendor;
  }

  @action
  void setaStatusListaProdutos(bool value){
    listaProdutosAtualizada = value;
  }

  Future<bool>obtemProdutosVendedorLogado(Map<String, dynamic> tokens)async{

    listaDeProdutos.clear();

    String url = "$urlRoot/lista-produto-vendedor/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};

    try{
      http.Response response = await http.get(Uri.parse(url),headers: headers);

      if(response.statusCode == 200){
        List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));
        for(var element in responseData){
          ProdutoVendedor produto = ProdutoVendedor.fromJson(element);
          listaDeProdutos.add(produto);
        }
        mensagem = "Lista de produtos atualizada!";
        return true;
      } else {
        mensagem = "Erro ao buscar seus produtos!";
        return false;
      }
    }catch (e){
      mensagem = "Algo deu errado";
      return false;
    }
  }


  @action
  Future<bool> cadastraProduto(Map<String, dynamic> dados, Map<String, dynamic> tokens) async{
    
    String url = "$urlRoot/produto-create/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};

    try{
      XFile imagem = dados["imagem"];

      String fileName = imagem.path.split("/").last;
      String filePath = imagem.path;

      var dio = Dio();
      dio.options.headers = headers;
  
      FormData formData = FormData.fromMap({
        "nome": dados["nome"],
        "descricao": dados["descricao"],
        "preco": double.parse(dados["preco"]),
        "quantidade": int.parse(dados["quantidade"]),
        "imagem": await MultipartFile.fromFile(filePath, filename: fileName),
        "vendedor": dados["vendedor"]
      });

      var response = await dio.post(url, data: formData);
      if(response.statusCode == 201){
        mensagem = "Produto cadastrado";
        return true;
      }else{
        mensagem = "Algo deu errado, verifique os dados e tente novamente";
        return false;
      }
    }catch (e){
      mensagem = "Algo deu errado, verifique os dados e sua conexão para tentar novamente";
      return false;
    }
  
  }

  
  @action
  Future<bool> editaProduto(Map<String, dynamic> dados, Map<String, dynamic> tokens) async{
    
    String url = "$urlRoot/produto/${dados["id"]}/update";
    var headers={"Authorization": "Bearer ${tokens['access']}"};

    try{
      XFile imagem = dados["imagem"];
      String fileName = imagem.path.split("/").last;
      String filePath = imagem.path;

      var dio = Dio();
      dio.options.headers = headers;

      FormData formData = FormData.fromMap({
        "nome": dados["nome"], "descricao": dados["descricao"],
        "preco": double.parse(dados["preco"]), "quantidade": int.parse(dados["quantidade"]),
        "imagem": await MultipartFile.fromFile(filePath, filename: fileName),
      });

      var response = await dio.patch(url, data: formData);

      if (response.statusCode == 200){
        selecionaProduto(ProdutoVendedor(
          id: response.data['id'], nome: response.data['nome'], 
          preco: response.data['preco'], quantidade: response.data['quantidade'], 
          descricao: response.data['descricao'], imagem: response.data['imagem'], 
          vendedorID: dados['vendedor']
        ));
        mensagem = "Produto atualizado com sucesso!";
        return  true;
      } else {
        mensagem = "Algo deu errado, verifique sua segurança e tente novamente!";
        return false;
      }
    }catch(e){
      mensagem = "Algo deu errado, verifique sua segurança e tente novamente!";
      return false;
    }

  }

  Future<bool> apagaProduto(Map<String, dynamic> tokens, int idProduto)async{
    String url = "$urlRoot/produto/$idProduto/delete/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};

    try{
      http.Response response = await http.delete(Uri.parse(url), headers: headers);
      if (response.statusCode == 204){
        mensagem = "Produto apagado com sucesso!";
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

  Future<bool> listaProdutosCliente()async{
    listaProdutos.clear();

    String url = "$urlRoot/lista-produtos/";

    try{
      http.Response response = await http.get(Uri.parse(url));
      
      if(response.statusCode == 200){
        List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));
        
        for (var element in responseData){
          VendedorProduto vendedor = VendedorProduto.fromJson(element["vendedor"]);
          Produto produto = Produto(
            id: element["id"], 
            nome: element["nome"], 
            preco: element["preco"], 
            quantidade: element["quantidade"], 
            imagem: element["imagem"], 
            vendedor: vendedor
          );
          listaProdutos.add(produto);
        }
        return true;
      }else{
        mensagem = "Algo deu errado, verifique sua conexão e tente novamente!";
        return false;
      }
    }catch(e){
      mensagem = "Algo deu errado, verifique sua conexão e tente novamente!";
      return false;
    }
    
  }
}