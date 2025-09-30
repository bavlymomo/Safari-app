import 'package:flutter/material.dart';
import 'package:safari_app/Widgets/Trip_item.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text("trips")),
      body: TripItem(
        label: args['title'],
        imageUrl: args['imgUrl'],
        season: args["season"],
        duration: args["duration"],
        act: ["act"],
      ),
    );
  }
}
