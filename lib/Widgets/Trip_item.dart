import 'package:flutter/material.dart';
import 'package:safari_app/model/Trip.dart';

class TripItem extends StatefulWidget {
  final List<String> cate;
  final String imageUrl;
  final String label;
  final int duration;
  final Season season;
  final List<String> act;

  const TripItem({
    super.key,
    required this.cate,
    required this.label,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.act,
  });

  @override
  State<TripItem> createState() => _TripItemState();
}

class _TripItemState extends State<TripItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed('/trip_dt', arguments: {'title': widget.label});
      },
      child: Card(
        elevation: 15,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(widget.imageUrl, fit: BoxFit.cover),
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
                        children: [
                          Icon(Icons.calendar_month),
                          Text("ايام ${widget.duration}"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.sunny),
                          Text(widget.season.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time),
                          Text(widget.act.first.toString()),
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
                widget.label,
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
    );
  }
}
