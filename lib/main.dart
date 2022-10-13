import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_3/android_home_page.dart';

import 'cupertino_home_page.dart';
import 'global.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Global.isIos
        ? const CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoHomePage(),
          )
        : const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
  }
}
