import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_2/cart.dart';
import 'package:outcaster_2/product.dart';
import 'package:outcaster_2/search.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

int initvalue = 0;

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              (initvalue != 2)
                  ? Text("   Cupertion Store",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
                  : Text("   Shopping Cart",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.815,
                width: double.infinity,
                color: Colors.white,
                child: IndexedStack(index: initvalue, children: [
                  product(),
                  search(),
                  cart(),
                ]),
              ),
              CupertinoTabBar(
                  currentIndex: initvalue,
                  onTap: (val) {
                    setState(() {
                      initvalue = val;
                    });
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home), label: "home"),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.search), label: "Search"),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.cart), label: "Cart"),
                  ]),
            ],
          )),
    );
  }
}
