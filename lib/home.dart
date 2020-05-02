import 'package:flutter/material.dart';
import 'package:verdadyvida_app/contenido.dart';

class Home extends StatefulWidget {
  @override
  _SwipeTabBarState createState() => _SwipeTabBarState();
}

class _SwipeTabBarState extends State<Home> {

  final _pageViewController = PageController();

  int _activePage = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: <Widget>[
          // AppBar(title:Text("TITLE")),
          Contenido(),
          Container(color: Colors.black12),
          Container(color: Colors.black26),
          Container(color: Colors.black38),
        ],
        onPageChanged: (index) {
          setState(() {
            _activePage = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activePage,
        onTap: (index) {
          _pageViewController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions,
              color: Colors.black45,
              size: 24.0,
              semanticLabel: 'Contenido',
            ), 
            activeIcon: Icon(
              Icons.subscriptions,
              color: Colors.red,
              size: 24.0,
              semanticLabel: 'Contenido',
            ), 
            title: Text("Contenido",
                        style:TextStyle( color: Colors.black.withOpacity(0.65))
                    )
          ),
                    BottomNavigationBarItem(
            icon: Icon(
              Icons.subtitles,
              color: Colors.black45,
              size: 24.0,
              semanticLabel: 'Noticias',
            ), 
            activeIcon: Icon(
              Icons.subtitles,
              color: Colors.purple,
              size: 24.0,
              semanticLabel: 'Noticias',
            ), 
            title: Text("Noticias",
                        style:TextStyle( color: Colors.black.withOpacity(0.65))
                    )
          ),
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black45,
              size: 24.0,
              semanticLabel: 'Hacer una donación',
            ), 
            activeIcon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 24.0,
              semanticLabel: 'Hacer una donación',
            ), 
            title: Text("Donar",
                        style:TextStyle( color: Colors.black.withOpacity(0.65))
                    )
          ),
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black45,
              size: 24.0,
              semanticLabel: 'Pestaña de perfil',
            ), 
            activeIcon: Icon(
              Icons.account_circle,
              color: Colors.blue,
              size: 24.0,
              semanticLabel: 'Pestaña de perfil',
            ), 
            title: Text("Perfil",
                        style:TextStyle( color: Colors.black.withOpacity(0.65))
                    )
          ),
        ],
      ),
    );
  }
}