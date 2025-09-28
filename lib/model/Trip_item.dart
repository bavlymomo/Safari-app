import 'package:flutter/material.dart';

class TripItem extends StatefulWidget {
  // final String imageUrl;
  final String label;
  const TripItem({super.key, required this.label});

  @override
  State<TripItem> createState() => _TripItemState();
}

class _TripItemState extends State<TripItem> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.label));
  }
}
