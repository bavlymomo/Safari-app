import 'package:flutter/material.dart';

class TripDetails extends StatefulWidget {
  const TripDetails({super.key});
  @override
  State<TripDetails> createState() {
    return _TripDetailsState();
  }
}

class _TripDetailsState extends State<TripDetails> {
  bool isclicked = false;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<String> acts = args['act'];
    List<String> progs = args['prog'];
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 255, 255, 255),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isclicked = !isclicked;
          });
          if (isclicked) {
            FavouriteTrips.ids.add(args['id']);
          } else {
            FavouriteTrips.ids.remove(args['id']);
          }
        },
        elevation: 15,
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: isclicked ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
      ),
      appBar: AppBar(
        title: Text(args['title']),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(args['imgurl'], fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "الانشطة",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: const Color.fromARGB(229, 255, 255, 255),
            ),
            height: 200,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Text(
                  acts[index],
                  style: TextStyle(
                    fontFamily: null,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  height: 30,
                  color: Colors.grey.shade400,
                );
              },
              itemCount: acts.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "البرنامج اليومي",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: const Color.fromARGB(229, 255, 255, 255),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: progs.asMap().entries.map((prog) {
                int ind = prog.key;
                String txt = prog.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 23,
                        child: Text(
                          'يوم ${ind + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 7, 112, 125),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(flex: 5, child: Text(txt)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class FavouriteTrips {
  static List<String> ids = [];
}
