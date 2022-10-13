import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_3/ios_screens/search_page.dart';
import 'package:outcaster_3/ios_screens/today_page_ios.dart';

import 'global.dart';
import 'ios_screens/apps_page_ios.dart';
import 'ios_screens/game_page_ios.dart';
import 'ios_screens/update_app_ios.dart';
import 'main.dart';

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({Key? key}) : super(key: key);

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage>
    with SingleTickerProviderStateMixin {
  List data = [
    const TodayPage(),
    const GamePageIOS(),
    const AppsPageIOS(),
    const UpdatePageIOS(),
    const SearchPageIOS(),
  ];

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: const Border(),
        trailing: CupertinoSwitch(
          activeColor: CupertinoColors.systemBlue.withOpacity(0.7),
          value: Global.isIos,
          onChanged: (val) {
            Global.isIos = val;
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const MyApp(),
                ),
                (route) => false);
          },
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: tabController.index,
          onTap: (val) {
            tabController.index = val;
          },
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.today),
              icon: Icon(CupertinoIcons.today_fill),
              label: "Today",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.rocket_fill),
              icon: Icon(CupertinoIcons.rocket),
              label: "Games",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.app_fill),
              icon: Icon(CupertinoIcons.app),
              label: "Apps",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.arrow_down_circle_fill),
              icon: Icon(CupertinoIcons.arrow_down_circle),
              label: "Updates",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.search_circle_fill),
              icon: Icon(CupertinoIcons.search_circle),
              label: "Search",
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return data[index];
            },
          );
        },
      ),
    );
  }
}
