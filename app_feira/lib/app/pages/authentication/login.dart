// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/authentication/envia_email.dart';
import 'package:app_feira/app/pages/crud/create_vendendor.dart';
import 'package:app_feira/app/pages/logs/logs.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  
  bool obscured = true;
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
                                  Text("Autenticação",
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
                                controller: senhaController,
                                obscureText: obscured,
                                cursorColor: ColorsApp().brancoPadrao,
                                style: TextStyle(color: ColorsApp().brancoPadrao),
                                decoration: InputDecoration(
                                  fillColor: ColorsApp().brancoPadrao,
                                  labelText: "Insira sua senha",
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
                                      onTap: toggleObscured,
                                      child: Icon(
                                        obscured
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
                            Center(
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) => const EnviaEmailWhatsapp()))
                                  );
                                }, 
                                child: Text("Esqueci minha senha.",
                                  style: TextStyle(
                                    color: ColorsApp().brancoPadrao,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.double
                                  ),
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 20.0, top: 30),
                              child: ElevatedButton(
                                onPressed: loginStores.clickBotao ? (){} : () async{
                                  loginStores.setaClickBotao(true);
                                  bool log = await loginStores.loginFunction(emailController.text, senhaController.text);
                                  if(log){
                                    loginStores.setaClickBotao(false);
                                    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: ((context) => const Logs()))
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
                                    Text("ENTRAR",
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
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Center(
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) => const CriarVendedor()))
                                    );
                                  }, 
                                  child: Text("Fazer cadastro.",
                                    style: TextStyle(
                                      color: ColorsApp().brancoPadrao,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                      decorationStyle: TextDecorationStyle.double
                                    ),
                                  )
                                ),
                              ),
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

  void toggleObscured() {
    setState(() {
      obscured = !obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

}