// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';


class EditaVendedor extends StatefulWidget {
  const EditaVendedor({super.key});

  @override
  State<EditaVendedor> createState() => _EditaVendedorState();
}

class _EditaVendedorState extends State<EditaVendedor> {

  TextEditingController nomeVendedorController = TextEditingController();
  TextEditingController dataNascimentoVendedorController = TextEditingController();
  TextEditingController naturalidadeVendedorController = TextEditingController();
  TextEditingController linkWhatsappVendedorController = TextEditingController();
  TextEditingController emailVendedorController = TextEditingController();

  DateTime? dataNascimento;
  
  @override
  void initState() {
    super.initState();
    loginStores.setaClickBotao(false);
    nomeVendedorController.text = vendedorStores.vendedor!.nome;
    dataNascimentoVendedorController.text = DateFormat("dd/MM/yyyy").format(vendedorStores.vendedor!.dataNascimento);
    naturalidadeVendedorController.text = vendedorStores.vendedor!.naturalidade;
    linkWhatsappVendedorController.text = vendedorStores.vendedor!.linkWhatsapp;
    emailVendedorController.text = vendedorStores.vendedor!.email;
  }

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
                          padding: const EdgeInsets.only(top: 30),
                          child: Text("alteração do vendedor",
                            style: TextStyle(
                              color: ColorsApp().brancoPadrao,
                              fontSize: 30,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 40, bottom: 15),
                          child: TextField(
                            controller: nomeVendedorController,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              fillColor: ColorsApp().brancoPadrao,
                              labelText: "Nome",
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
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: dataNascimentoVendedorController,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            onTap: ()async{
                              DateTime? pickeddate = await showDatePicker(
                                context: context, 
                                initialDate: DateTime.now(), 
                                firstDate: DateTime(2011), 
                                lastDate: DateTime(2101),
                              );
                              if (pickeddate != null){
                                setState(() {
                                  dataNascimentoVendedorController.text = DateFormat("dd/MM/yyyy").format(pickeddate);
                                  dataNascimento = pickeddate;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              fillColor: ColorsApp().brancoPadrao,
                              labelText: "Data de nascimento",
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
                              suffixIcon: Icon(Icons.calendar_today_rounded,color: ColorsApp().verdeBotaoPadrao), 
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: naturalidadeVendedorController,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              fillColor: ColorsApp().brancoPadrao,
                              labelText: "Sua naturalidade",
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
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: linkWhatsappVendedorController,
                            keyboardType: TextInputType.number,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsApp().roxoContainerPadrao,
                              labelText: "Whatsapp",
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
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: emailVendedorController,
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
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp().vermelhoVoltarErros,
                                  minimumSize: const Size(140, 40)
                                ),
                                child: Text("Cancelar",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: ColorsApp().brancoPadrao
                                  ),
                                )
                              ),
                              Observer(
                                builder: (context){
                                  return ElevatedButton(
                                    onPressed: loginStores.clickBotao ? (){} :()async{
                                      loginStores.setaClickBotao(true);
                                      DateTime dataNasci = dataNascimento == null ? vendedorStores.vendedor!.dataNascimento : dataNascimento!;
                                      bool editado = await vendedorStores.editaVendedor(
                                        nomeVendedorController.text, 
                                        dataNasci, 
                                        naturalidadeVendedorController.text, 
                                        linkWhatsappVendedorController.text, 
                                        emailVendedorController.text, 
                                        loginStores.getTokens
                                      );
                                      
                                      if(editado){
                                        nomeVendedorController.clear();                                     
                                        dataNascimentoVendedorController.clear(); 
                                        naturalidadeVendedorController.clear(); 
                                        linkWhatsappVendedorController.clear(); 
                                        emailVendedorController.clear(); 

                                        loginStores.setaClickBotao(false);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("Dados editados com sucesso",
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
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorsApp().verdeBotoesAuxiliares,
                                      minimumSize: const Size(140, 40)
                                    ),
                                    child: loginStores.clickBotao ?
                                      CircularProgressIndicator(
                                        color: ColorsApp().brancoPadrao,
                                      )
                                      : Text("Salvar",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: ColorsApp().roxoContainerPadrao
                                      ),
                                    )
                                  );
                                },
                              ),
                            ]
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
}