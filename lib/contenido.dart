import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:verdadyvida_app/videos.dart';
import 'package:verdadyvida_app/screens/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Contenido extends StatefulWidget {
  Contenido({Key key}) : super(key: key);

  @override
  _contenidoState createState() => _contenidoState();
}

class _contenidoState extends State<Contenido> {
  @override
  Widget build(BuildContext context) {
    var _selectedIndex;
        return Container(
          
          child: Stack(
            
            children: <Widget>[
              
              ContenidoTab(),

            ],

          )
    );
  }
}



class ContenidoTab extends StatefulWidget {
  @override
  _ContenidoTabState createState() => _ContenidoTabState();
}

class _ContenidoTabState extends State<ContenidoTab> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
      List<Widget> _widgetOptions = <Widget>[

        new HomeScreen(),
        Text(
          'En construcción',
          style: optionStyle,
        ),

  ];

  Widget build(BuildContext context) {
    
    return Stack(
      children: <Widget>[
      Center(
        
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      Container(
        margin: const EdgeInsets.only(top: 0.0),
        decoration: BoxDecoration( color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                duration: Duration(milliseconds: 200),
                tabBackgroundColor: Colors.purple,
                tabs: [
                  GButton(
                    icon: Icons.local_movies,
                    text: 'Videos',
                  ),
                  GButton(
                    icon: Icons.record_voice_over,
                    text: 'Podcast',
                  ),

                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
      

      ],
    );
  }
}