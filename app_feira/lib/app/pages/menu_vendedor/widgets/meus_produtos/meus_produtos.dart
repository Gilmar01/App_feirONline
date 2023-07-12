// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/menu_vendedor/widgets/meus_produtos/edita_produto.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class MeusProdutos extends StatefulWidget {
  const MeusProdutos({super.key});

  @override
  State<MeusProdutos> createState() => _MeusProdutosState();
}

class _MeusProdutosState extends State<MeusProdutos> {

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
                          padding: const EdgeInsets.only(left: 8, right: 8, top: 28, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(produtosStores.produtoSelecionado!.imagem),
                                )
                              )
                            ],
                          ),
                        ),

                        fazWidgetsDados("Nome:", produtosStores.produtoSelecionado!.nome),
                        fazWidgetsDados("Preço:", produtosStores.produtoSelecionado!.preco.replaceAll('.', ',')),
                        fazWidgetsDados("Quantidade:", produtosStores.produtoSelecionado!.quantidade),

                        fazWidgetDescricao("Descrição:", produtosStores.produtoSelecionado!.descricao),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const EditaProduto())
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp().verdeBotoesAuxiliares
                                ),
                                child: Text("Editar",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: ColorsApp().roxoContainerPadrao
                                  ),
                                )
                              ),
                              ElevatedButton(
                                onPressed: () {showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return WillPopScope(
                                      onWillPop: () async => false, 
                                      child: AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          content: GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                              onTap: () {}, 
                                              child: AlertDialog(
                                                title: const Text('Exclusão'),
                                                content: const Text('Você realmente deseja apagar o produto?'),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: ColorsApp().vermelhoVoltarErros,
                                                    ),
                                                    child: const Text('Cancelar'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  Observer(
                                                    builder: (context){
                                                      return ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: ColorsApp().verdeBotaoPadrao,
                                                        ),
                                                        onPressed: loginStores.clickBotao ? (){}:()async{
                                                          loginStores.setaClickBotao(true);
                                                          bool apagado = await produtosStores.apagaProduto(
                                                            loginStores.tokens,
                                                            produtosStores.produtoSelecionado!.id
                                                          );
                                                          if(apagado){
                                                            Navigator.of(context).pop();
                                                            Navigator.of(context).pop();
                                                            loginStores.setaClickBotao(false);
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(
                                                                content: Text(produtosStores.mensagem,
                                                                  style: TextStyle(color: ColorsApp().roxoContainerPadrao)
                                                                ),
                                                                backgroundColor: ColorsApp().verdeBotaoPadrao,
                                                                action: SnackBarAction(
                                                                  label: 'Fechar',
                                                                  textColor: Colors.black,
                                                                  onPressed: (){},
                                                                ),
                                                              )
                                                            );
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
                                                        child: loginStores.clickBotao ?
                                                          CircularProgressIndicator(
                                                            color: ColorsApp().brancoPadrao,
                                                          )
                                                          :Text('Confirmar',
                                                          style: TextStyle(
                                                            color: ColorsApp().roxoContainerPadrao
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp().vermelhoVoltarErros
                                ),
                                child: const Text("Apagar",
                                  style: TextStyle(
                                    fontSize: 25
                                  ),
                                )
                              ),
                            ],
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

  Widget fazWidgetsDados(String titulo, var dado){

    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp().verdeBotaoPadrao,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                    child: Text(titulo,
                      style: TextStyle(
                        color: ColorsApp().roxoContainerPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                    child: Text(dado.toString(),
                      style: TextStyle(
                        color: ColorsApp().roxoContainerPadrao,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }

  Widget fazWidgetDescricao(String titulo, var dado){

    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 20),
        child: Container(
          width: MediaQuery.of(context).size.height*1,
          height: 150,
          decoration: BoxDecoration(
            color: ColorsApp().verdeBotaoPadrao,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                child: Text(titulo,
                  style: TextStyle(
                    color: ColorsApp().roxoContainerPadrao,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                child: Text(dado.toString(),
                  style: TextStyle(
                    color: ColorsApp().roxoContainerPadrao,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

}