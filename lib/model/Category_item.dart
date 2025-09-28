import 'package:flutter/material.dart';
import 'package:safari_app/App_data.dart';
import './Category_item.dart';

class CategoryItem extends StatelessWidget {
  String source;
  String title;
  CategoryItem({super.key, required this.source, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/trips',
          arguments: {'id': "t1", 'title': "Cairo trip" },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 8 / 10,
              child: Image.network(source, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(color: const Color.fromARGB(91, 0, 0, 0)),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
