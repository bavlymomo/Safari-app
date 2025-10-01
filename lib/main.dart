import 'package:flutter/material.dart';
import 'package:safari_app/Screens/Favourite.dart';
import 'package:safari_app/Screens/Categoies_screen.dart';
import 'package:safari_app/Screens/Trip_details.dart';
import 'package:safari_app/Screens/Trips_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _indexPage = 0;
  List<Widget> pages = [Home(), Favourite()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ar')],
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColor: Colors.amberAccent,
        fontFamily: 'ElMessiri',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 12,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          iconTheme: IconThemeData(
            
            color: Colors.white, // back arrow color
            size: 22, // back arrow size
          ),
        ),
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),

          headlineMedium: TextStyle(
            fontSize: 25,
            color: const Color.fromARGB(255, 5, 115, 205),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/trips': (context) => TripsScreen(),
        '/trip_dt': (context) => TripDetails(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text(_indexPage == 0 ? " التصنيفات" : "المفضلة"),
          centerTitle: true,
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
          },
        ),
      ),
    );
  }
}
