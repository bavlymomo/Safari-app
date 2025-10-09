import 'package:flutter/material.dart';
import 'package:safari_app/App_data.dart';
import 'package:safari_app/Screens/Trip_details.dart';
import 'package:safari_app/Widgets/Trip_item.dart';
import 'package:safari_app/model/Trip.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Trip> FavTripsScreen = Trips_data.where((trip) {
    return FavouriteTrips.ids.contains(trip.id);
  }).toList();

  @override
  Widget build(BuildContext context) {
    return FavTripsScreen.isEmpty
        ? Align(
            widthFactor: 30,
            child: Text(
              "There are no favourite trips yet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : ListView(
            children: FavTripsScreen.map(
              (mytrip) => TripItem(
                id: mytrip.id,
                cate: mytrip.categories,
                label: mytrip.title,
                imageUrl: mytrip.imageUrl,
                duration: mytrip.duration,
                season: mytrip.season,
                act: mytrip.activities,
                programs: mytrip.program,
                deletedItem: (val) {
                  FavTripsScreen.remove(val);
                },
              ),
            ).toList(),
          );
  }
}
