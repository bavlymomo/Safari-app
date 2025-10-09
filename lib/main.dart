import 'package:flutter/material.dart';
import 'package:safari_app/App_data.dart';
import 'package:safari_app/Screens/Filter.dart';
import 'package:safari_app/Screens/Trip_details.dart';
import 'package:safari_app/Screens/Trips_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:safari_app/Widgets/TabScreen.dart';
import 'package:safari_app/model/Trip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false,
  };
  List<Trip> _availableTrips = Trips_data;

  changevalues(Map<String, bool> ChangedValues) {
    setState(() {
      _filters = ChangedValues;
      _availableTrips = Trips_data.where((trip) {
        if (_filters["summer"] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters["winter"] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters["family"] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/main':
            return MaterialPageRoute(builder: (context) => Mainscreen());
          case '/trips':
            return MaterialPageRoute(
              builder: (context) =>
                  TripsScreen(availableTrips: _availableTrips),
              settings: settings,
            );

          case '/trip_dt':
            return MaterialPageRoute(builder: (context) => TripDetails());
          case '/filter':
            return MaterialPageRoute(
              builder: (context) =>
                  Filter(Savedvalues: changevalues, currentValues: _filters),
            );
          default:
            return null;
        }
      },

      home: Mainscreen(),
    );
  }
}
