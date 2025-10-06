import 'package:flutter/material.dart';
import 'package:safari_app/Screens/Categoies_screen.dart';
import 'package:safari_app/Screens/Favourite.dart';
import 'package:safari_app/Widgets/MyDrawer.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _indexPage = 0;
  List<Widget> pages = [Home(), Favourite()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_indexPage == 0 ? " التصنيفات" : "المفضلة"),
        centerTitle: true,
      ),
      drawer: Drawer(child: Mydrawer()),
      body: pages[_indexPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexPage,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(label: "التصنيفات", icon: Icon(Icons.list)),
          BottomNavigationBarItem(label: "المفضلة", icon: Icon(Icons.star)),
        ],
        onTap: (value) {
          setState(() {
            _indexPage = value;
          });
          ;
        },
      ),
    );
  }
}
