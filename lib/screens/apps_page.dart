import 'package:flutter/material.dart';
import 'package:outcaster_3/widgets.dart';

import '../global.dart';
import 'detai_page_android.dart';

class ForYouApps extends StatefulWidget {
  const ForYouApps({Key? key}) : super(key: key);

  @override
  State<ForYouApps> createState() => _ForYouAppsState();
}

class _ForYouAppsState extends State<ForYouApps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: ListView(
        children: [
          titleText("Google Apps"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.googleApp
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        Global.selected = e;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPageAndroid()),
                        );
                      },
                      child: Hero(
                        tag: e["name"],
                        child: appContainer(e),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          titleText("Popular Apps"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.popularApps.map((e) => appContainer(e)).toList(),
            ),
          ),
          titleText("Top Apps"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.topApps.map((e) => appContainer(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TopChartApps extends StatefulWidget {
  const TopChartApps({Key? key}) : super(key: key);

  @override
  State<TopChartApps> createState() => _TopChartAppsState();
}

class _TopChartAppsState extends State<TopChartApps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: Global.topApps.length,
        itemBuilder: (context, i) {
          return topContainer(Global.topApps, i);
        },
      ),
    );
  }
}
