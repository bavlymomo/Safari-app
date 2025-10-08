import 'package:flutter/material.dart';
import 'package:safari_app/Widgets/Trip_item.dart';
import 'package:safari_app/model/Trip.dart';
import '../App_data.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

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
      custometrips = Trips_data.where(
        (trip) => trip.categories.contains(args['id']),
      ).toList();
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
                  print("Trying to delete $val");
                  setState(() {
                    custometrips.removeWhere((trip) {
                      print("Checking ${trip.id}");
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
