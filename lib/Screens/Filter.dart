import 'package:flutter/material.dart';
import 'package:safari_app/app_data.dart';
import 'package:safari_app/Widgets/MyDrawer.dart';
import 'package:safari_app/model/Trip.dart';

class Filter extends StatefulWidget {
  final Map<String, bool> currentValues;

  final Function savedvalues;
  const Filter({
    super.key,
    required this.savedvalues,
    required this.currentValues,
  });

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _summer = false;
  bool _winter = false;
  bool _family = false;

  @override
  void initState() {
    _summer = widget.currentValues['summer']!;
    _winter = widget.currentValues['winter']!;
    _family = widget.currentValues['family']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Mydrawer()),
      appBar: AppBar(
        title: const Text(" تصفية"),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> status = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.savedvalues(status);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('هل انت متاكد '),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/main');
                        },
                        child: Text("نعم"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("لا"),
                      ),
                    ],
                  );
                },
              );

              // Navigator.of(context).pop();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          mySwitch("رحلات صيفية", "اظهر الرحلات الصيفية فقط ", _summer, (val) {
            setState(() {
              _summer = val;
            });
          }),

          mySwitch("رحلات شتوية", "اظهر الرحلات الشتوية فقط ", _winter, (val) {
            setState(() {
              _winter = val;
            });
            Special.SpecialTrips = Trips_data.where(
              (trip) => trip.isInWinter,
            ).toList();
          }),

          mySwitch(" للعائلات", "ظهر الرحلات التي للعائلات فقط,", _family, (
            val,
          ) {
            setState(() {
              _family = val;
            });
            Special.SpecialTrips = Trips_data.where(
              (trip) => trip.isForFamilies,
            ).toList();
          }),
        ],
      ),
    );
  }

  ListTile mySwitch(
    String title,
    String subtitle,
    bool val,
    Function(bool val) isActive,
  ) {
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
          value: val,
          onChanged: isActive,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          activeThumbColor: Colors.blue,
        ),
      ),
    );
  }
}

class Special {
  static List<Trip> SpecialTrips = Trips_data;
}
