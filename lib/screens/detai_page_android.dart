import 'package:flutter/material.dart';

import '../global.dart';

class DetailPageAndroid extends StatefulWidget {
  const DetailPageAndroid({Key? key}) : super(key: key);

  @override
  State<DetailPageAndroid> createState() => _DetailPageAndroidState();
}

class _DetailPageAndroidState extends State<DetailPageAndroid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              height: 170,
              child: Column(
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: Global.selected["name"],
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.05),
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(
                                Global.selected["image"].toString(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${Global.selected["name"]}",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
