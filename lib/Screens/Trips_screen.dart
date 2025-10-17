// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:safari_app/Widgets/trip_item.dart';
import 'package:safari_app/model/Trip.dart';

// ignore: must_be_immutable
class TripsScreen extends StatefulWidget {
  List<Trip> availableTrips;
  TripsScreen({super.key, required this.availableTrips});

  @override
  State<TripsScreen> createState() {
    return _TripsScreenState();
  }
}

class _TripsScreenState extends State<TripsScreen> {
  late List<Trip> custometrips;
  late String title;
  bool isLoaded = false;
  @override
  void didChangeDependencies() {
    if (!isLoaded) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      title = args['title'];
      custometrips = widget.availableTrips
          .where((trip) => trip.categories.contains(args['id']))
          .toList();
      isLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: custometrips
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
                deletedItem: (val) {
                  setState(() {
                    custometrips.removeWhere((trip) {
                      return trip.id == val;
                    });
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
