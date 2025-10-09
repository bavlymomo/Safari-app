import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("دليلك السياحي", style: TextStyle(fontFamily: "ElMessiri")),
        backgroundColor: Colors.amber,
        // leading: null,
      ),
      body: Align(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Cate1("الرحلات", Icons.shopping_bag, () {
              Navigator.of(context).pushReplacementNamed('/main');
            }),
            SizedBox(height: 5),
            Cate1("تصفية", Icons.filter, () {
              Navigator.of(context).pushNamed('/filter');
            }),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListTile Cate1(String text, IconData icon, Function() where) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(color: Colors.lightBlue, size: 20, icon),
      onTap: where,
    );
  }
}
