import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_2/global.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  Spacer(),
                  Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: global.search
                  .map((e) => Column(
                        children: [
                          Row(
                            children: [
                              Image.network("${e['image']}", height: 120),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${e['name']}"),
                                  Text("PR. ${e['price']}")
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      e['bool'] = !e['bool'];
                                      if (e['bool'] == true) {
                                        global.allproduct.add(e);
                                        global.total = 0;
                                        for (int i = 0;
                                            i < global.allproduct.length;
                                            i++) {
                                          global.total = global.total +
                                              global.allproduct[i]['price'];
                                        }
                                      } else {
                                        global.allproduct.remove(e);
                                        global.total = 0;
                                        for (int i = 0;
                                            i < global.allproduct.length;
                                            i++) {
                                          global.total = global.total +
                                              global.allproduct[i]['price'];
                                        }
                                      }
                                    });
                                  },
                                  child: (e['bool'] == false)
                                      ? Icon(CupertinoIcons.add_circled)
                                      : Icon(CupertinoIcons.add_circled_solid)),
                              SizedBox(width: 15),
                            ],
                          ),
                          Divider(thickness: 1),
                        ],
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
