import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("بحث تصفية")),
      body: Column(
        children: [
          mySwitch("رحلات صيفية", "اظهر الرحلات الصيفية فقط ", isActive1),
          mySwitch("رحلات شتوية", "اظهر الرحلات الشتوية فقط ", isActive2),
          mySwitch(" للعائلات", "ظهر الرحلات التي للعائلات فقط ", isActive3),
        ],
      ),
    );
  }

  ListTile mySwitch(String title, String subtitle, bool isActive) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.labelMedium),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          inherit: false,
          fontFamily: null,
          color: Color.fromARGB(255, 98, 98, 98),
        ),
      ),
      trailing: Transform.scale(
        scale: 0.8,
        child: Switch(
          value: isActive,
          onChanged: (value) {
            setState(() {
              isActive = value;
            });
          },
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          activeColor: Colors.blue,
        ),
      ),
    );
  }
}
