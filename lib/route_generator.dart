import 'package:colegio_app/view/form_alumnos.dart';
import 'package:colegio_app/view/home.dart';
import 'package:colegio_app/view/salones/salones_lista.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
 static Route<dynamic>? generateRoute(RouteSettings settings){

   final args = settings.arguments;

   switch(settings.name) {
   // case '/launch':
   //   return MaterialPageRoute(builder: (_) => LaunchScreen());
     case '/home':
       return MaterialPageRoute(builder: (_) => Home());
     // case '/formAlumnos':
     //   return MaterialPageRoute(builder: (_) => FormAlumnos(data));
     case '/salonesLista':
       return MaterialPageRoute(builder: (_) => SalonesLista());

   }
 }
}