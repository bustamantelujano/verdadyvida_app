import 'package:flutter/material.dart';

class Contenido extends StatefulWidget {
  Contenido({Key key}) : super(key: key);

  @override
  _contenidoState createState() => _contenidoState();
}

class _contenidoState extends State<Contenido> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(color: Colors.red),
    );
  }
}