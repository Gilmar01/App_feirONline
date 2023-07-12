// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/cliente/logs_cliente.dart';
import 'package:app_feira/app/pages/logs/logs.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().brancoPadrao,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsApp().roxoContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Observer(
                      builder: (context){
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40, bottom: 35),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Área inicial",
                                    style: TextStyle(
                                      color: ColorsApp().brancoPadrao,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 40.0, top: 40),
                              child: ElevatedButton(
                                onPressed: loginStores.clickBotao ? (){} :()async{
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const LogsCliente())
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp().verdeBotaoPadrao,
                                  minimumSize: const Size(300, 50)
                                ), 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Cliente",
                                      style: TextStyle(
                                        color: ColorsApp().roxoContainerPadrao,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                )  
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 80.0, top: 20),
                              child: ElevatedButton(
                                onPressed: loginStores.clickBotao ? (){} :()async{
                                  loginStores.setaClickBotao(true);
                                  bool vendedorSetado = await loginStores.registraAppVendendor("vendedor");
                                  if(vendedorSetado){
                                    loginStores.setaClickBotao(false);
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const Logs())
                                    );
                                  }else{
                                    loginStores.setaClickBotao(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text("Algo deu errado",
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
                                  backgroundColor: ColorsApp().verdeBotaoPadrao,
                                  minimumSize: const Size(300, 50)
                                ), 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    loginStores.clickBotao ?
                                    CircularProgressIndicator(
                                      color: ColorsApp().brancoPadrao,
                                    )
                                    :Text("Vendendor",
                                      style: TextStyle(
                                        color: ColorsApp().roxoContainerPadrao,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                )  
                              )
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}