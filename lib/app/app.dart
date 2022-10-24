
import 'package:advanced_flutter/presentation/resources/routes.dart';
import 'package:advanced_flutter/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  MyApp._internal() ;
  int appState = 0 ;
  static final MyApp _instance = MyApp._internal();
factory MyApp()=> _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:RouteGenerator.getRoute ,
      initialRoute: Routes.splashRoute,
      theme: getThemeData(),);
  }
}
