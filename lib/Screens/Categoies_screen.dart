import 'package:flutter/material.dart';
import '../app_data.dart';
import '../Widgets/category_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 21 / 25,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: [
        ...Categories_data.map(
          (item) => CategoryItem(
            source: item.imageUrl,
            title: item.title,
            id: item.id,
          ),
        ),
      ],
    );
  }
}
