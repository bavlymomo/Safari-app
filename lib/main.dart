import 'package:flutter/material.dart';
import 'package:safari_app/Screens/Favourite.dart';
import 'package:safari_app/Screens/Categoies_screen.dart';
import 'package:safari_app/Screens/Filter.dart';
import 'package:safari_app/Screens/Trip_details.dart';
import 'package:safari_app/Screens/Trips_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:safari_app/Widgets/MainScreen.dart';
import 'package:safari_app/Widgets/MyDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {


  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          iconTheme: IconThemeData(color: Colors.white, size: 22),
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
          labelMedium: TextStyle(
            fontFamily: null,
            inherit: false,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.amber[500]),
      ),
      routes: {
        '/main': (context) => Mainscreen(),
        '/trips': (context) => TripsScreen(),
        '/trip_dt': (context) => TripDetails(),
        '/filter': (context) => Filter(),
      },
      home: Mainscreen(),
    );
  }
}
