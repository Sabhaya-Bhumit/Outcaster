import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_2/global.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: global.product
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
      ),
    );
  }
}
