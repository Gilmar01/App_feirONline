// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:io';

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class EditaProduto extends StatefulWidget {
  const EditaProduto({super.key});

  @override
  State<EditaProduto> createState() => _EditaProdutoState();
}

class _EditaProdutoState extends State<EditaProduto> {

  TextEditingController nomeProdutoController = TextEditingController();
  TextEditingController precoProdutoController = TextEditingController();
  TextEditingController quantidadeProdutoController = TextEditingController();
  TextEditingController urlImagemProdutoController = TextEditingController();
  TextEditingController descricaoProdutoController = TextEditingController();

  XFile? image;

  @override
  void initState() {
    super.initState();
    nomeProdutoController.text = produtosStores.produtoSelecionado!.nome;
    precoProdutoController.text = produtosStores.produtoSelecionado!.preco.replaceAll('.', ',');
    quantidadeProdutoController.text = produtosStores.produtoSelecionado!.quantidade.toString();
    urlImagemProdutoController.text = produtosStores.produtoSelecionado!.imagem;
    descricaoProdutoController.text = produtosStores.produtoSelecionado!.descricao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsApp().roxoContainerPadrao,
                      borderRadius: BorderRadius.circular(6)  
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text("Edição de produto",
                            style: TextStyle(
                              color: ColorsApp().brancoPadrao,
                              fontSize: 30,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 40, bottom: 15),
                          child: TextField(
                            controller: nomeProdutoController,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              fillColor: ColorsApp().brancoPadrao,
                              labelText: "Nome do produto",
                              labelStyle: TextStyle(
                                color:ColorsApp().brancoPadrao
                              ), 
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao,
                                  width: 1
                                ),
                              ), 
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: precoProdutoController,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              fillColor: ColorsApp().brancoPadrao,
                              labelText: "Preço do produto",
                              labelStyle: TextStyle(
                                color:ColorsApp().brancoPadrao
                              ), 
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao,
                                  width: 1
                                ),
                              ), 
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: quantidadeProdutoController,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              fillColor: ColorsApp().brancoPadrao,
                              labelText: "Quantidade de produtos",
                              labelStyle: TextStyle(
                                color:ColorsApp().brancoPadrao
                              ), 
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao,
                                  width: 1
                                ),
                              ), 
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: descricaoProdutoController,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsApp().roxoContainerPadrao,
                              labelText: "Descrição do produto",
                              labelStyle: TextStyle(
                                color:ColorsApp().brancoPadrao
                              ), 
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsApp().brancoPadrao,
                                  width: 1
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Observer(
                                builder: (context){
                                  return Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: ColorsApp().brancoPadrao,
                                      borderRadius: BorderRadius.circular(6)  
                                    ),
                                    child: image == null ? 
                                      Image.network(produtosStores.produtoSelecionado!.imagem)
                                      : 
                                      Image.file(File(image!.path), fit: BoxFit.cover)
                                  );
                                }
                              ),
                              ElevatedButton(
                                onPressed: ()async{
                                  image = await ImagePicker().pickImage(
                                    source: ImageSource.gallery
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp().verdeBotoesAuxiliares,
                                ), 
                                child: Text(
                                  "Escolher imagem",
                                  style: TextStyle(
                                    color: ColorsApp().roxoContainerPadrao
                                  ),
                                )
                              )
                            ],
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp().vermelhoVoltarErros,
                                  minimumSize: const Size(140, 40)
                                ),
                                child: Text("Cancelar",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: ColorsApp().brancoPadrao
                                  ),
                                )
                              ),
                              Observer(
                                builder: (context) {
                                  return ElevatedButton(
                                    onPressed: loginStores.clickBotao ? (){} :()async{
                                      loginStores.setaClickBotao(true);
                                      bool imagemConvertida =  await converteImagemUrlEmArquivo(
                                        produtosStores.produtoSelecionado!.imagem,
                                        image,
                                        produtosStores.produtoSelecionado!.nome,
                                        context
                                      );
                                      if (imagemConvertida){
                                        bool editado = await produtosStores.editaProduto(
                                          {
                                            "id": produtosStores.produtoSelecionado!.id,
                                            "nome": nomeProdutoController.text,
                                            "preco": trataPreco(precoProdutoController.text),
                                            "quantidade": quantidadeProdutoController.text,
                                            "descricao": descricaoProdutoController.text,
                                            "imagem": image,
                                            "vendedor": produtosStores.produtoSelecionado!.vendedorID
                                          }, 
                                          loginStores.getTokens
                                        );
                                        if (editado){
                                          loginStores.setaClickBotao(false);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(produtosStores.mensagem,
                                                style: TextStyle(color: ColorsApp().brancoPadrao)
                                              ),
                                              backgroundColor: ColorsApp().verdeBotoesAuxiliares,
                                              action: SnackBarAction(
                                                label: 'Fechar',
                                                textColor: Colors.black,
                                                onPressed: (){},
                                              ),
                                            )
                                          );
                                          nomeProdutoController.text = produtosStores.produtoSelecionado!.nome;
                                          precoProdutoController.text = produtosStores.produtoSelecionado!.preco.replaceAll('.', ',');
                                          quantidadeProdutoController.text = produtosStores.produtoSelecionado!.quantidade.toString();
                                          descricaoProdutoController.text = produtosStores.produtoSelecionado!.descricao;
                                        }else{
                                          loginStores.setaClickBotao(false);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(produtosStores.mensagem,
                                                style: const TextStyle(color: Colors.white)
                                              ),
                                              backgroundColor: Colors.redAccent,
                                              action: SnackBarAction(
                                                label: 'Fechar',
                                                textColor: Colors.black,
                                                onPressed: (){},
                                              ),
                                            )
                                          );
                                        }
                                      } else{
                                        loginStores.setaClickBotao(false);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: const Text("Algo deu errado, cheque sua conexão e tente novamente!",
                                              style: TextStyle(color: Colors.white)
                                            ),
                                            backgroundColor: Colors.redAccent,
                                            action: SnackBarAction(
                                              label: 'Fechar',
                                              textColor: Colors.black,
                                              onPressed: (){},
                                            ),
                                          )
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorsApp().verdeBotoesAuxiliares,
                                      minimumSize: const Size(140, 40)
                                    ),
                                    child: loginStores.clickBotao ?
                                      CircularProgressIndicator(
                                        color: ColorsApp().brancoPadrao,
                                      )
                                      :Text("Salvar",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: ColorsApp().roxoContainerPadrao
                                      ),
                                    )
                                  );
                                },
                              ),
                            ]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }


  Future<bool> converteImagemUrlEmArquivo(String url, XFile? imagem, String nomeProduto, BuildContext context)async{
    if(imagem == null){
      try{
        final response = await http.get(Uri.parse(url));
        if(response.statusCode == 200){
          final diretorio = await getApplicationDocumentsDirectory();
          final arquivo = File(join(diretorio.path, "imagem-$nomeProduto.png"));
          arquivo.writeAsBytesSync(response.bodyBytes);

          setState(() {
            image = XFile(arquivo.path);
          });
          return true;
        }else{
          return false;
        }
      }catch (e){
        return false;
      }
    }else{
      return true;
    }
    
  }

  String trataPreco(String value){
    String newValue = "";
    for(int i = 0; i < value.length; i++){
      if(value[i] == ','){
        newValue += '.';
      }else{
        newValue += value[i];
      }
    }
    return newValue;
  }

}