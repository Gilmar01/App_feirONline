// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';


class CreateProduto extends StatefulWidget {
  const CreateProduto({super.key});

  @override
  State<CreateProduto> createState() => _CreateProdutoState();
}

class _CreateProdutoState extends State<CreateProduto> {

  TextEditingController nomeProdutoController = TextEditingController();
  TextEditingController precoProdutoController = TextEditingController();
  TextEditingController quantidadeProdutoController = TextEditingController();
  TextEditingController urlImagemProdutoController = TextEditingController();
  TextEditingController descricaoProdutoController = TextEditingController();

  XFile? image;

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
                          child: Text("Cadastro de produto",
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
                            keyboardType: TextInputType.number,
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
                            keyboardType: TextInputType.number,
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
                                      Icon(
                                        Icons.image, 
                                        color: ColorsApp().roxoContainerPadrao,
                                        size: 50,
                                      )
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
                                    setState(() {
                                      if (image != null){
                                        
                                        urlImagemProdutoController.text = image!.path;
                                      }
                                    });
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
                                    onPressed: loginStores.clickBotao ? (){} : () async{
                                      loginStores.setaClickBotao(true);
                                      bool cadastrado = await produtosStores.cadastraProduto(
                                        {
                                          "nome": nomeProdutoController.text,
                                          "preco": trataPreco(precoProdutoController.text),
                                          "quantidade": quantidadeProdutoController.text,
                                          "descricao": descricaoProdutoController.text,
                                          "imagem": image,
                                          "vendedor": vendedorStores.vendedor!.id
                                        }, 
                                        loginStores.getTokens);
                                      
                                      if(cadastrado){
                                        loginStores.setaClickBotao(false);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(produtosStores.mensagem,
                                              style: TextStyle(color: ColorsApp().roxoContainerPadrao)
                                            ),
                                            backgroundColor: ColorsApp().verdeBotoesAuxiliares,
                                            action: SnackBarAction(
                                              label: 'Fechar',
                                              textColor: Colors.black,
                                              onPressed: (){},
                                            ),
                                          )
                                        );
                                        nomeProdutoController.clear();
                                        precoProdutoController.clear();
                                        quantidadeProdutoController.clear();
                                        descricaoProdutoController.clear();
                                        setState(() {
                                          image = null;
                                        });                                          
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
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorsApp().verdeBotoesAuxiliares,
                                      minimumSize: const Size(140, 40)
                                    ),
                                    child: loginStores.clickBotao ?
                                      CircularProgressIndicator(
                                        color: ColorsApp().brancoPadrao,
                                      )
                                      : Text("Salvar",
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