import 'package:flutter/material.dart';
import 'package:safari_app/Screens/Favourite.dart';
import 'package:safari_app/Screens/Categoies_screen.dart';
import 'package:safari_app/Screens/Trips_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _indexPage = 1;
  List<Widget> pages = [Favourite(), Home()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/trips': (context) => TripsScreen()},
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _indexPage == 0 ? "المفضلة" : " التصنيفات",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.list, color: Colors.white, size: 30),
            ),
          ],
        ),
        body: pages[_indexPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexPage,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(label: "المفضلة", icon: Icon(Icons.star)),
            BottomNavigationBarItem(label: "التصنيفات", icon: Icon(Icons.list)),
          ],
          onTap: (value) {
            setState(() {
              _indexPage = value;
            });
          },
        ),
      ),
    );
  }
}
