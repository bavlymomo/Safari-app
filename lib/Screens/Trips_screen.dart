import 'package:flutter/material.dart';
import 'package:safari_app/Widgets/Trip_item.dart';
import 'package:safari_app/model/Trip.dart';
import '../App_data.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<Trip> custometrips = Trips_data.where(
      (trip) => trip.categories.any((cat) => cat == args['id']),
    ).toList();
    // Trip mytrip = custometrips[1];
    return Scaffold(
      appBar: AppBar(title: Text(args['title'])),
      body: ListView(
        children: custometrips
            .map(
              (mytrip) => TripItem(
                cate: mytrip.categories,
                label: mytrip.title,
                imageUrl: mytrip.imageUrl,
                duration: mytrip.duration,
                season: mytrip.season,
                act: mytrip.activities,
              ),
            )
            .toList(),
      ),
    );
  }
}
