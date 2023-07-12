
// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/cliente/home_cliente.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';


class LogsCliente extends StatefulWidget {
  const LogsCliente({super.key});

  @override
  State<LogsCliente> createState() => _LogsClienteState();
}

class _LogsClienteState extends State<LogsCliente> {

  @override
  void initState() {
    super.initState();

    produtosStores.listaProdutosCliente().then((value) async{

      if(value){
        Navigator.of(context).pop();
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeCliente())
        );
      }else{
        Navigator.of(context).pop();
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

    });

    /* loginStores.checkLogin().then((value) async {
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
    }); */
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