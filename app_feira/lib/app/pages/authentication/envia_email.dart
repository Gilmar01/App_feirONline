// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/authentication/redefine_senha.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class EnviaEmailWhatsapp extends StatefulWidget {
  const EnviaEmailWhatsapp({super.key});

  @override
  State<EnviaEmailWhatsapp> createState() => _EnviaEmailWhatsappState();
}

class _EnviaEmailWhatsappState extends State<EnviaEmailWhatsapp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  
  final textFieldFocusNode = FocusNode();

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
                                  Text("Redefinição de senha",
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
                              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 40, bottom: 15),
                              child: TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: ColorsApp().brancoPadrao,
                                style: TextStyle(color: ColorsApp().brancoPadrao),
                                decoration: InputDecoration(
                                  fillColor: ColorsApp().brancoPadrao,
                                  labelText: "Insira seu email",
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
                              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 40, bottom: 15),
                              child: TextField(
                                controller: whatsappController,
                                keyboardType: TextInputType.number,
                                cursorColor: ColorsApp().brancoPadrao,
                                style: TextStyle(color: ColorsApp().brancoPadrao),
                                decoration: InputDecoration(
                                  fillColor: ColorsApp().brancoPadrao,
                                  labelText: "Insira seu número de whatsapp",
                                  hintText: "5599900000000",
                                  helperText: "Somente números com o código 55 e o DD",
                                  helperStyle: TextStyle(
                                    color:ColorsApp().verdeBotoesAuxiliares  
                                  ),
                                  hintStyle: TextStyle(
                                    color:ColorsApp().verdeBotoesAuxiliares  
                                  ),
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
                              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 20.0, top: 30),
                              child: ElevatedButton(
                                onPressed: loginStores.clickBotao ? (){} : () async{
                                  loginStores.setaClickBotao(true);
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  bool enviado = await loginStores.buscaUserPeloEmail(emailController.text, whatsappController.text);
                                  if(enviado){
                                    loginStores.setaClickBotao(false);
                                    Navigator.of(context).pop();
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) => const RedefineSenha()))
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(loginStores.mensagem,
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
                                  }else{
                                    loginStores.setaClickBotao(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(loginStores.mensagem,
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
                                    :
                                    Text("ENVIAR",
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