import 'package:flutter/material.dart';
import '../App_data.dart';
import 'package:safari_app/App_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextButton _category(String label, String source) {
    return TextButton(
      onPressed: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(source),
            Positioned.fill(
              child: Container(color: const Color.fromARGB(86, 0, 0, 0)),
            ),
            Text(
              label,
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 13 / 14,
          // mainAxisSpacing: 5,
        ),
        children: [
          _category(Categories_data[1].title, Categories_data[1].imageUrl),
          _category(Categories_data[1].title, Categories_data[1].imageUrl),
          _category(Categories_data[1].title, Categories_data[1].imageUrl),
          _category(Categories_data[1].title, Categories_data[1].imageUrl),
          _category(Categories_data[1].title, Categories_data[1].imageUrl),
          _category(Categories_data[1].title, Categories_data[1].imageUrl),
        ],
      ),
    );
  }
}
