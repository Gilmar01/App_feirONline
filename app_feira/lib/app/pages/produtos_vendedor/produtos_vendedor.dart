// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/crud/create_produto.dart';
import 'package:app_feira/app/pages/menu_vendedor/widgets/meus_produtos/meus_produtos.dart';
import 'package:app_feira/main.dart';
import 'package:app_feira/models/produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProdutoVendedorList extends StatefulWidget {
  const ProdutoVendedorList({super.key});

  @override
  State<ProdutoVendedorList> createState() => _ProdutoVendedorListState();
}

class _ProdutoVendedorListState extends State<ProdutoVendedorList> {

  List<ProdutoVendedor> listaProdutoVendedor = [];

  @override
  void initState() {
    super.initState();

    listaProdutoVendedor = produtosStores.listaDeProdutos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().verdeBotoesAuxiliares,
      appBar: AppBar(
        backgroundColor: ColorsApp().roxoContainerPadrao,
        title: Text("Meus produtos",
          style: TextStyle(
            color: ColorsApp().brancoPadrao,
            fontSize: 25
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (){
                Navigator.push(context,   
                  MaterialPageRoute(builder: (context) => const CreateProduto())  
                );
              },
              iconSize: 40.0, 
              icon: Icon(
                Icons.add, 
                color: ColorsApp().brancoPadrao,)
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    if (produtosStores.listaDeProdutos.isEmpty)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                "Você não possui nennhum produto cadastrado no nosso sistema.", 
                                style: TextStyle(
                                  color: ColorsApp().roxoContainerPadrao
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    for(ProdutoVendedor produto in listaProdutoVendedor)
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        width: MediaQuery.of(context).size.height*1,
                        decoration: BoxDecoration(
                          color: ColorsApp().roxoContainerPadrao,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nome: ${produto.nome}",
                                    style: TextStyle(
                                      color: ColorsApp().brancoPadrao,
                                      fontSize: 15
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text("Preço: ${produto.preco.replaceAll('.', ',')}",
                                      style: TextStyle(
                                        color: ColorsApp().brancoPadrao,
                                        fontSize: 15
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp().verdeBotaoPadrao,
                                ),
                                onPressed: (){
                                  produtosStores.selecionaProduto(produto);
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const MeusProdutos())
                                  );
                                }, 
                                child: Text(
                                  "Detalhes", 
                                  style: TextStyle(
                                    color: ColorsApp().roxoContainerPadrao,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    Container(
                      height: 80,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Observer(
        builder: (context) {
          return FloatingActionButton(
            onPressed: loginStores.clickBotao ? (){} :()async{
              loginStores.setaClickBotao(true);
              bool atualizado = await produtosStores.obtemProdutosVendedorLogado(loginStores.getTokens);
              if(atualizado){
                loginStores.setaClickBotao(false);
                atualizaListaProdutosFront();
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
            backgroundColor: ColorsApp().corExtra,
            child: loginStores.clickBotao ?
              CircularProgressIndicator(
                color: ColorsApp().brancoPadrao,
              )
              : Icon(
              Icons.refresh,
              color: ColorsApp().brancoPadrao,
            ),
          );
        }
      ),
    );
  }

  void atualizaListaProdutosFront(){
    setState(() {
      listaProdutoVendedor = produtosStores.listaDeProdutos;
    });
  }

}