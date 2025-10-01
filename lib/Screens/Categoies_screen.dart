import 'package:flutter/material.dart';
import '../App_data.dart';
import '../Widgets/Category_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      // padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7.5 / 8,
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
