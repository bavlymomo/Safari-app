import 'package:flutter/material.dart';
import 'package:safari_app/model/Trip.dart';

class TripItem extends StatefulWidget {
  final String imageUrl;
  final String label;
  final int duration;
  final Season season;
  final List<String> act;

  const TripItem({
    super.key,
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
    return Card(
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
            child: Container(
              height: 50,
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
                        Text(widget.act.toString()),
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
    );
  }
}
