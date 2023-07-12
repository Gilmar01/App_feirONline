// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/crud/edita_vendedor.dart';
import 'package:app_feira/app/pages/logs/logs.dart';
import 'package:app_feira/app/widgets/logo.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';


class MeusDados extends StatefulWidget {
  const MeusDados({super.key});

  @override
  State<MeusDados> createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDados> {

  String textoApagaConta = 
    "Você realmente deseja apagar sua conta?\n\n"
    "Ao fazer isso você não terá mais como recuperar suas informações na plataforma.";

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
                              retornaLogoRedondo(context)
                            ],
                          ),
                        ),

                        fazWidgetsDados("Nome:", vendedorStores.vendedor!.nome),
                        fazWidgetsDados("Naturalidade:", vendedorStores.vendedor!.naturalidade),
                        fazWidgetsDados("Data de nasciemnto:", vendedorStores.vendedor!.dataNascimento),
                        fazWidgetsDados("Email:", vendedorStores.vendedor!.email),
                        fazWidgetsDados("Whatsapp:", vendedorStores.vendedor!.linkWhatsapp),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const EditaVendedor())
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
                                                content: Text(textoApagaConta),
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
                                                          bool deltado = await vendedorStores.apagarVendedor(loginStores.getTokens);
                                                          if(deltado){
                                                            bool limpdados = await loginStores.apagaTokens();
                                                            if(limpdados){
                                                              loginStores.setaClickBotao(false);
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(
                                                                  content: Text(vendedorStores.mensagem,
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
                                                              Navigator.pushReplacement(context,
                                                                MaterialPageRoute(builder: (context) => const Logs())
                                                              );
                                                            }
                                                          }else{
                                                            loginStores.setaClickBotao(false);
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(
                                                                content: Text(vendedorStores.mensagem,
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
                                                          color: ColorsApp().roxoContainerPadrao,
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

    if (dado is DateTime){
      dado = DateFormat('dd/MM/yyyy').format(dado);
    } else {
      dado = dado.toString();
    }

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
                    child: Text(dado,
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
}