import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/produtos_vendedor/produtos_vendedor.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';

class AtualizaListaProdutos extends StatefulWidget {
  const AtualizaListaProdutos({super.key});

  @override
  State<AtualizaListaProdutos> createState() => _AtualizaListaProdutosState();
}

class _AtualizaListaProdutosState extends State<AtualizaListaProdutos> {

  @override
  void initState() {
    super.initState();

    produtosStores.obtemProdutosVendedorLogado(loginStores.getTokens).then((value) async {
      if(value){
        Navigator.of(context).pop();
        Navigator.push(context,   
          MaterialPageRoute(builder: (context) => const ProdutoVendedorList())  
        );
      }else{
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
        Navigator.of(context).pop();

        produtosStores.setaStatusListaProdutos(false);
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
                "Atualizando lista de produtos...", 
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