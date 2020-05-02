import 'package:flutter/material.dart';
import 'package:verdadyvida_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Verdad y Vida',
      debugShowCheckedModeBanner: false,

     home: Home(),
   );
 }
}