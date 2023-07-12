import 'package:app_feira/app/colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_feira/main.dart';
import 'package:app_feira/models/produto.dart';
import 'package:flutter/material.dart';


class HomeCliente extends StatefulWidget {
  const HomeCliente({super.key});

  @override
  State<HomeCliente> createState() => _HomeClienteState();
}

class _HomeClienteState extends State<HomeCliente> {

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          children: [
                            for (Produto produto in produtosStores.listaProdutos)
                              Container(
                                margin: const EdgeInsets.all(12),
                                width: 350,
                                height: MediaQuery.of(context).size.height*0.92,
                                padding: const EdgeInsetsDirectional.all(8),
                                decoration: BoxDecoration(
                                  color: ColorsApp().roxoContainerPadrao,
                                  borderRadius: BorderRadius.circular(6)  
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 300,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(2)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(produto.imagem),
                                        )
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 6),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Produto: ${produto.nome}",
                                                  style: TextStyle(
                                                    color: ColorsApp().brancoPadrao,
                                                    fontSize: 20
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Produto: ${produto.preco.replaceAll('.', ',')}",
                                                  style: TextStyle(
                                                    color: ColorsApp().brancoPadrao,
                                                    fontSize: 20
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: Row(
                                              children: [
                                                Text( "Vendedor: ",
                                                  style: TextStyle(
                                                    color: ColorsApp().brancoPadrao,
                                                    fontSize: 20
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Row(
                                              children: [
                                                Text(produto.vendedor.nome,
                                                  style: TextStyle(
                                                    color: ColorsApp().brancoPadrao,
                                                    fontSize: 15
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 80),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                contatarVendendor(produto.vendedor.linkWhatsapp);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: ColorsApp().verdeBotaoPadrao,
                                                minimumSize: const Size(300, 50)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Contatar vendendor",
                                                    style: TextStyle(
                                                      color: ColorsApp().roxoContainerPadrao,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  
                                                ],
                                              )
                                            ) 
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        )
                      )    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Future<void> contatarVendendor(String url)async{
    
    String urlWhatsapp ="whatsapp://send?phone=$url&text=Olá,tudo bem?";

    if(await canLaunchUrl(Uri.parse(urlWhatsapp))){
      await launchUrl(Uri.parse(urlWhatsapp)); 
    }/* else{
      throw Exception('Erro ao contatar vendendor');
    } */
    
  }
}