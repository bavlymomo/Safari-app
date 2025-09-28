import 'package:flutter/material.dart';
import '../App_data.dart';
import 'package:safari_app/App_data.dart';
import '../model/Category_item.dart';

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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 5,
      ),
      children: [
        ...Categories_data.map(
          (item) => CategoryItem(source: item.imageUrl, title: item.title),
        ),
      ],
    );
  }
}
