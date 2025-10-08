import 'package:flutter/material.dart';
import 'package:safari_app/App_data.dart';
import 'package:safari_app/model/Trip.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;

  // Activity (bool val , bool isActive){
  //   setState(() {
  //     isActive =val
  //   });
  // }
  // static List<Trip> SpecialTrips = Trips_data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("بحث تصفية")),
      body: Column(
        children: [
          mySwitch("رحلات صيفية", "اظهر الرحلات الصيفية فقط ", isActive1, (
            val,
          ) {
            setState(() {
              isActive1 = val;
            });
            Special.SpecialTrips = Trips_data.where(
              (trip) => trip.isInSummer,
            ).toList();
          }),

          mySwitch("رحلات شتوية", "اظهر الرحلات الشتوية فقط ", isActive2, (
            val,
          ) {
            setState(() {
              isActive2 = val;
            });
            Special.SpecialTrips = Trips_data.where(
              (trip) => trip.isInWinter,
            ).toList();
          }),

          mySwitch(" للعائلات", "ظهر الرحلات التي للعائلات فقط,", isActive3, (
            val,
          ) {
            setState(() {
              isActive3 = val;
            });
            Special.SpecialTrips = Trips_data.where(
              (trip) => trip.isForFamilies,
            ).toList();
          }),
        ],
      ),
    );
  }

  ListTile mySwitch(
    String title,
    String subtitle,
    bool val,
    Function(bool val) isActive,
  ) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.labelMedium),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          inherit: false,
          fontFamily: null,
          color: Color.fromARGB(255, 98, 98, 98),
        ),
      ),
      trailing: Transform.scale(
        scale: 0.8,
        child: Switch(
          value: val,
          onChanged: isActive,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          activeColor: Colors.blue,
        ),
      ),
    );
  }
}

class Special {
  static List<Trip> SpecialTrips = Trips_data;
}
