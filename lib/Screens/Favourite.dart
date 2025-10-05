import 'package:flutter/material.dart';
import 'package:safari_app/App_data.dart';
import 'package:safari_app/Screens/Trip_details.dart';
import 'package:safari_app/Widgets/Trip_item.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          Trips_data.where((trip) {
                return FavouriteTrips.ids.any((id) => id == trip.id);
              })
              .map(
                (mytrip) => TripItem(
                  id: mytrip.id,
                  cate: mytrip.categories,
                  label: mytrip.title,
                  imageUrl: mytrip.imageUrl,
                  duration: mytrip.duration,
                  season: mytrip.season,
                  act: mytrip.activities,
                  programs: mytrip.program,
                ),
              )
              .toList(),
    );
  }
}
