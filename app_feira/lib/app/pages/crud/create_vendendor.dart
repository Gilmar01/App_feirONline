// ignore_for_file: use_build_context_synchronously

import 'package:app_feira/app/colors/colors.dart';
import 'package:app_feira/app/pages/authentication/login.dart';
import 'package:app_feira/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';


class CriarVendedor extends StatefulWidget {
  const CriarVendedor({super.key});

  @override
  State<CriarVendedor> createState() => _CriarVendedorState();
}

class _CriarVendedorState extends State<CriarVendedor> {

  TextEditingController nomeVendedorController = TextEditingController();
  TextEditingController dataNascimentoVendedorController = TextEditingController();
  TextEditingController naturalidadeVendedorController = TextEditingController();
  TextEditingController linkWhatsappVendedorController = TextEditingController();
  TextEditingController emailVendedorController = TextEditingController();
  TextEditingController senhaVendedorController = TextEditingController();
  TextEditingController senhaConfirmaVendedorController = TextEditingController();

  bool obscuredSenha = true;
  bool obscuredConfirmaSenha = true;
  final textFieldFocusNode = FocusNode();
  
  DateTime? dataNascimento;
  
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
                          child: Text("Cadastro de vendedor",
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
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsApp().roxoContainerPadrao,
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
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: senhaVendedorController,
                            obscureText: obscuredSenha,
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
                                  onTap: toggleObscuredSenha,
                                  child: Icon(
                                    obscuredSenha
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
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: senhaConfirmaVendedorController,
                            obscureText: obscuredConfirmaSenha,
                            cursorColor: ColorsApp().brancoPadrao,
                            style: TextStyle(color: ColorsApp().brancoPadrao),
                            decoration: InputDecoration(
                              fillColor: ColorsApp().brancoPadrao,
                              labelText: "Confirme sua senha",
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
                                  onTap: toggleObscuredConfirmaSenha,
                                  child: Icon(
                                    obscuredConfirmaSenha
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
                                      bool criado = await vendedorStores.cadastrarVendedor(
                                        nomeVendedorController.text, 
                                        dataNascimento!, 
                                        naturalidadeVendedorController.text, 
                                        linkWhatsappVendedorController.text, 
                                        emailVendedorController.text, 
                                        senhaVendedorController.text, 
                                        senhaConfirmaVendedorController.text
                                      );
                                      if(criado){
                                        loginStores.setaClickBotao(false);
                                        Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: ((context) => const Login()))
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

  void toggleObscuredSenha() {
    setState(() {
      if(!obscuredConfirmaSenha){
        obscuredConfirmaSenha = !obscuredConfirmaSenha;
      }
      obscuredSenha = !obscuredSenha;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

  void toggleObscuredConfirmaSenha() {
    setState(() {
      if(!obscuredSenha){
        obscuredSenha = !obscuredSenha;
      }
      obscuredConfirmaSenha = !obscuredConfirmaSenha;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

}