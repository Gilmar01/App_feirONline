// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class MudaSenha extends StatefulWidget {
  const MudaSenha({super.key});

  @override
  State<MudaSenha> createState() => _MudaSenhaState();
}

class _MudaSenhaState extends State<MudaSenha> {

  TextEditingController senhaAntigaController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaconfirmController = TextEditingController();
  
  bool obscuredSenhaAntiga = true;
  bool obscuredSenhaNova = true;
  bool obscuredSenhaConfirma = true;
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
                                  Text("Mudança de senha",
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
                                obscureText: obscuredSenhaAntiga,
                                controller: senhaAntigaController,
                                cursorColor: ColorsApp().brancoPadrao,
                                style: TextStyle(color: ColorsApp().brancoPadrao),
                                decoration: InputDecoration(
                                  fillColor: ColorsApp().brancoPadrao,
                                  labelText: "Sua senha antiga",
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
                                  prefixIcon: Icon(Icons.lock_rounded,color: ColorsApp().verdeBotaoPadrao), 
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap: toggleObscuredSenhaAntiga,
                                      child: Icon(
                                        obscuredSenhaAntiga
                                        ? Icons.visibility_rounded
                                        :Icons.visibility_off_rounded,
                                        size: 24,
                                        color: ColorsApp().verdeBotaoPadrao,
                                      ),
                                    ),
                                  ), 
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 20, bottom: 15),
                              child: TextField(
                                obscureText: obscuredSenhaNova,
                                controller: senhaController,
                                cursorColor: ColorsApp().brancoPadrao,
                                style: TextStyle(color: ColorsApp().brancoPadrao),
                                decoration: InputDecoration(
                                  fillColor: ColorsApp().brancoPadrao,
                                  labelText: "Sua senha nova",
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
                                  prefixIcon: Icon(Icons.lock_rounded,color: ColorsApp().verdeBotaoPadrao), 
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap: toggleObscuredSenhaNova,
                                      child: Icon(
                                        obscuredSenhaNova
                                        ? Icons.visibility_rounded
                                        :Icons.visibility_off_rounded,
                                        size: 24,
                                        color: ColorsApp().verdeBotaoPadrao,
                                      ),
                                    ),
                                  ), 
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 20, bottom: 15),
                              child: TextField(
                                obscureText: obscuredSenhaConfirma,
                                controller: senhaconfirmController,
                                cursorColor: ColorsApp().brancoPadrao,
                                style: TextStyle(color: ColorsApp().brancoPadrao),
                                decoration: InputDecoration(
                                  fillColor: ColorsApp().brancoPadrao,
                                  labelText: "Confirma sua nova senha",
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
                                  prefixIcon: Icon(Icons.lock_rounded,color: ColorsApp().verdeBotaoPadrao), 
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap: toggleObscuredSenhaConfirma,
                                      child: Icon(
                                        obscuredSenhaConfirma
                                        ? Icons.visibility_rounded
                                        :Icons.visibility_off_rounded,
                                        size: 24,
                                        color: ColorsApp().verdeBotaoPadrao,
                                      ),
                                    ),
                                  ), 
                                ),
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 30.0, top: 30),
                              child: ElevatedButton(
                                onPressed: loginStores.clickBotao ? (){} : () async{
                                  loginStores.setaClickBotao(true);
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  bool senhaMudada = await loginStores.mudaSenha(
                                    senhaAntigaController.text,
                                    senhaController.text,
                                    senhaconfirmController.text,
                                    loginStores.getTokens
                                  );
                                  if(senhaMudada){
                                    senhaAntigaController.clear();
                                    senhaController.clear();
                                    senhaconfirmController.clear();
                                    loginStores.setaClickBotao(false);
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
                                    Text("SALVAR",
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

  void toggleObscuredSenhaAntiga() {
    setState(() {
      if (!obscuredSenhaNova){
        obscuredSenhaNova = !obscuredSenhaNova;
      }
      if(!obscuredSenhaConfirma){
        obscuredSenhaConfirma = !obscuredSenhaConfirma;
      }
      obscuredSenhaAntiga = !obscuredSenhaAntiga;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

  void toggleObscuredSenhaNova() {
    setState(() {
      if (!obscuredSenhaAntiga){
        obscuredSenhaAntiga = !obscuredSenhaAntiga;
      }
      if(!obscuredSenhaConfirma){
        obscuredSenhaConfirma = !obscuredSenhaConfirma;
      }
      obscuredSenhaNova = !obscuredSenhaNova;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

  void toggleObscuredSenhaConfirma() {
    setState(() {
      if (!obscuredSenhaAntiga){
        obscuredSenhaAntiga = !obscuredSenhaAntiga;
      }
      if(!obscuredSenhaNova){
        obscuredSenhaNova = !obscuredSenhaNova;
      }
      obscuredSenhaConfirma = !obscuredSenhaConfirma;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

}