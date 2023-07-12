import 'package:flutter/material.dart';

Widget retornaLogo(){
  return Center(
     // ignore: sized_box_for_whitespace
    child: Container(
    height: 160,
    child: const Image(image: AssetImage('assets/images/logo-feira.png')),
    ),
  );
}

Widget retornaLogoRedondo(BuildContext context){
  return ElevatedButton(
    onPressed: (){
      mostraSobre(context);
    },
    style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
    ), 
    child: Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100)
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(image: AssetImage('assets/images/logo-feira.png')),
      )
    ),
  );
}

void mostraSobre(BuildContext context){
  
  String textoSobre = "Olá, aproveite os recursos de nossa feira online";

  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: const Text("Sobre",
        textAlign: TextAlign.center,
      ),
      content: Text(textoSobre,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 17,
          ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, 
          child: const Text("Fechar!")
        )
      ],
    )
  );
}