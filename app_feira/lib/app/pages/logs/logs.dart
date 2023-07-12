
// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/authentication/login.dart';
import 'package:app_feira/app/pages/home/home.dart';
import 'package:app_feira/app/pages/menu_vendedor/menu_vendedor.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';


class Logs extends StatefulWidget {
  const Logs({super.key});

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {

  @override
  void initState() {
    super.initState();

    loginStores.checkLogin().then((value) async {
      bool isVendedor = await loginStores.obtemAppVendendor();
      
      if(isVendedor && value){
        bool vendedor = await vendedorStores.obtemVendendorUser(loginStores.getTokens);
        
        if(vendedor){
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const MenuVendedor()))
          );
        }else{
          bool deletado = await loginStores.apagaTokens();
          if(deletado){
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage())
            );
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
        }
      }else if(isVendedor && !value){
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Login())
        );
      } else{
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomePage())
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().brancoPadrao,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                "Aguarde...", 
                style: TextStyle(
                  color: ColorsApp().roxoContainerPadrao
                ),
              ),
            ),
            CircularProgressIndicator(
              color: ColorsApp().roxoContainerPadrao,
            ),
          ],
        )
      ),
    );
  }
}