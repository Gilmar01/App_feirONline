// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/pages/home/home.dart';
import 'package:app_feira/app/pages/menu_vendedor/widgets/muda_senha.dart';
import 'package:app_feira/app/pages/produtos_vendedor/atualiza_lista.dart';
import 'package:app_feira/app/widgets/logo.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../colors/colors.dart';
import 'widgets/meus_dados.dart';

class BodyMenuVendedor extends StatefulWidget {
  const BodyMenuVendedor({super.key});

  @override
  State<BodyMenuVendedor> createState() => _BodyMenuVendedorState();
}

class _BodyMenuVendedorState extends State<BodyMenuVendedor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child:Container(
          width: MediaQuery.of(context).size.height*1,
          height: MediaQuery.of(context).size.height*0.92,
          decoration: BoxDecoration(
            color: ColorsApp().roxoContainerPadrao,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: retornaLogoRedondo(context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 50, top: 8.0),
                child: Text(formataNome(vendedorStores.vendedor!.nome),
                  style: TextStyle(
                    color: ColorsApp().brancoPadrao,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              fazBotoesBody("Meus dados", const MeusDados()),
              fazBotoesBody("Meus produtos", const AtualizaListaProdutos()),
              fazBotoesBody("Mudar senha", const MudaSenha()),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 25, bottom: 35),
                child: Row(
                  children: [
                    TextButton(
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
                                    onTap: (){}, 
                                    child: AlertDialog(
                                      title: const Text('Logout'),
                                      content: const Text('Você realmente deseja sair do sistema?'),
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
                                              onPressed: loginStores.clickBotao ? (){}:() async {
                                                loginStores.setaClickBotao(true);
                                                bool deletado = await loginStores.apagaTokens();
                                                if(deletado){
                                                  loginStores.setaClickBotao(false);
                                                  Navigator.of(context).pop();
                                                  Navigator.pushReplacement(context,
                                                    MaterialPageRoute(builder: (context) => const HomePage())
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
                      child: Text("Sair",
                        style: TextStyle(
                          color: ColorsApp().brancoPadrao,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double
                        ),
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  Widget fazBotoesBody(String titulo, Widget menuDesejado){
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
        child: Observer(
          builder: (context){
            return Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => menuDesejado)
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp().verdeBotaoPadrao,
                  minimumSize: const Size(300, 60)
                ), 
                child: Text(titulo,
                  style: TextStyle(
                    color: ColorsApp().roxoContainerPadrao,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            );
          }
      ),
    );
  }

  String formataNome(String? nome){
    if (nome == null){
      return "Aguarde...";
    }
    String nomeFormatado= "";
    List<String> nomelist = nome.split(" ");
    
    if (nomelist.length == 1){
      nomeFormatado = nomelist[0];
      return "Olá, $nomeFormatado";
    }
    if (nomelist[1] == "da" || nomelist[1] == "de" || nomelist[1] == "do"){
      for(int index = 0; index < 3; index ++){
        if(index == 0){
          nomeFormatado += nomelist[index];
        } else{
          nomeFormatado += " ${nomelist[index]}";
        }
      }
    }else{
      for(int index = 0; index < 2; index ++){
        if(index == 0){
          nomeFormatado += nomelist[index];
        } else{
          nomeFormatado += " ${nomelist[index]}";
        }
      }
    }
    return "Olá, $nomeFormatado";
  }

}