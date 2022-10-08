import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white.withOpacity(0.5),
        ),
        Column(
          children: [
            Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.blueGrey,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      CircleAvatar(radius: 50),
                      SizedBox(height: 10),
                      Text("    Bhumit Sabhaya",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("    +91 905451918",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18)),
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.people_outline),
                      title: Text("New Group"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_outline_rounded),
                      title: Text("New Contact"),
                    ),
                    ListTile(
                      leading: Icon(Icons.call_outlined),
                      title: Text("Calls"),
                    ),
                    ListTile(
                      leading: Icon(Icons.bookmark_outline),
                      title: Text("Saved Massages"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings_outlined),
                      title: Text("Settings"),
                    ),
                  ],
                ))
          ],
        ),
       
      ],
    );
  }
}
