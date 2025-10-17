import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  String source;
  String title;
  String id;
  CategoryItem({
    super.key,
    required this.id,
    required this.source,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
      
        Navigator.of(
          context,
        ).pushNamed('/trips', arguments: {'id': id, 'title': title});
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
