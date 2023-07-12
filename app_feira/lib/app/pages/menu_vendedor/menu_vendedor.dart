import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'body_menu_vendendor.dart';

class MenuVendedor extends StatefulWidget {
  const MenuVendedor({super.key});

  @override
  State<MenuVendedor> createState() => _MenuVendedorState();
}

class _MenuVendedorState extends State<MenuVendedor> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (context){
            return const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BodyMenuVendedor(),
                ],
              ),
            );
          },
        ),
      )
    );
  }

}