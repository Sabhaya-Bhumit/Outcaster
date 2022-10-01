import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_2/global.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

DateTime initialDate = DateTime.now();
String selectDate = '';
int Selecthour = 0;

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          CupertinoTextField(
            prefix: Icon(Icons.person),
            placeholder: "Enter Name",
          ),
          SizedBox(height: 10),
          CupertinoTextField(
            prefix: Icon(Icons.email),
            placeholder: "Enter Email",
          ),
          SizedBox(height: 10),
          CupertinoTextField(
            prefix: Icon(Icons.location_on_sharp),
            placeholder: "Enter Location",
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.access_time_rounded),
              Text(" Delivery time", style: TextStyle(color: Colors.grey)),
              Spacer(),
              Text("$selectDate", style: TextStyle(color: Colors.grey)),
              SizedBox(width: 20),
            ],
          ),
          Container(
            color: Colors.white,
            height: 300,
            width: double.infinity,
            child: CupertinoDatePicker(
              initialDateTime: initialDate,
              mode: CupertinoDatePickerMode.dateAndTime,
              onDateTimeChanged: (val) {
                setState(() {
                  int selecthour = 0;
                  if (val != null) {
                    if (val.hour > 12) {
                      setState(() {
                        selecthour = (val.hour) - 12;
                      });
                    } else {
                      selecthour = val.hour;
                    }
                  }
                  selectDate =
                      '${val.month} ${val.day} ${val.year} $selecthour:${val.minute}:${DateTime.now().second}';
                });
              },
            ),
          ),
          Divider(thickness: 3),
          ...global.allproduct
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
                    ],
                  ))
              .toList(),
          (global.allproduct.isEmpty == true)
              ? Container()
              : Divider(thickness: 3),
          Align(
            alignment: Alignment.bottomRight,
            child: Text("Total ${global.total}"),
          )
        ],
      ),
    );
  }
}
