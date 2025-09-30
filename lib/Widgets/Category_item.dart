import 'package:flutter/material.dart';
import 'package:safari_app/App_data.dart';
import 'package:safari_app/model/Trip.dart';

class CategoryItem extends StatelessWidget {
  String source;
  String title;
  CategoryItem({super.key, required this.source, required this.title});
  Trip t = Trips_data[1];
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/trips',
          arguments: {
            'id': t.id,
            'title': t.title,
            "imgUrl": t.imageUrl,
            "duration": t.duration,
            "season": t.season,
            "act": t.activities,
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 22 / 25,
              child: Image.network(source, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(color: const Color.fromARGB(91, 0, 0, 0)),
            ),
            Text(title, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
