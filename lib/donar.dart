import 'package:flutter/material.dart';

class Donar extends StatefulWidget {
  Donar({Key key}) : super(key: key);

  @override
  _donarState createState() => _donarState();
}

class _donarState extends State<Donar> {
  @override
      //  body: 
  final _controller = ScrollController();
  final _height = 100.0;
  Widget build(BuildContext context) {
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat;

    return Scaffold(
          
          body: ListView.builder(
          controller: _controller,
          itemCount: 6,
          itemBuilder: (_, i) => Container(
            height: _height,
            child: Card(child: Center(child: Text("Item $i"))),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: new FloatingActionButton.extended(
          onPressed: () {},
          // icon: Icon(Icons.save),
          label: 
          Row(
            children: <Widget>[
              Text('Hacer una donación'),
              Icon(Icons.favorite)
            ],
          )
          ,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(10.0))
          // ),

          backgroundColor: Colors.red,


        ),
      ) ;


       

       
  
  }
}