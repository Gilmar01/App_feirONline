
import 'package:app_feira/app/pages/logs/logs.dart';
import 'package:app_feira/stores/login.stores.dart';
import 'package:app_feira/stores/produtos.stores.dart';
import 'package:app_feira/stores/vendedor.stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


LoginStores loginStores = LoginStores();
VendedorStores vendedorStores = VendedorStores();
ProdutosStores produtosStores = ProdutosStores();

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('pt', 'BR')
      ],
      home: Logs(),
    );
  }
}