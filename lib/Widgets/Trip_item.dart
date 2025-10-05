import 'package:flutter/material.dart';
import 'package:safari_app/model/Trip.dart';

class TripItem extends StatelessWidget {
  final List<String> cate;
  final String imageUrl;
  final String label;
  final int duration;
  final Season season;
  final List<String> act;
  final List<String> programs;
  final String id;

  const TripItem({
    super.key,
    required this.id,
    required this.cate,
    required this.label,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.act,
    required this.programs,
  });

  Map<String, Icon> chose() {
    Icon sIcon;
    switch (season) {
      case Season.Winter:
        return {"شتاء": Icon(Icons.ac_unit)};
      case Season.Summer:
        return {"صيف": Icon(Icons.wb_sunny)};
      case Season.Spring:
        return {"ربيع": Icon(Icons.local_florist)};
      case Season.Autumn:
        return {"خريف": Icon(Icons.eco)};
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/trip_dt',
          arguments: {
            'id': id,
            'title': label,
            'imgurl': imageUrl,
            'act': act,
            'prog': programs,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          elevation: 8,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 45,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 7,
                          children: [
                            Icon(Icons.calendar_month),
                            Text("$duration ايام"),
                          ],
                        ),
                        Row(
                          spacing: 7,

                          children: [
                            chose().values.first,
                            Text(chose().keys.first),
                          ],
                        ),
                        Row(
                          spacing: 7,
                          children: [
                            Icon(Icons.access_time),
                            Text(act.first.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 50,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
