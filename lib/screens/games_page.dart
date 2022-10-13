import 'package:flutter/material.dart';
import 'package:outcaster_3/widgets.dart';

import '../global.dart';

class ForYouGames extends StatefulWidget {
  const ForYouGames({Key? key}) : super(key: key);

  @override
  State<ForYouGames> createState() => _ForYouGamesState();
}

class _ForYouGamesState extends State<ForYouGames> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: ListView(
        children: [
          titleText("Game We Are Playing"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.game.map((e) => gameContainer(e)).toList(),
            ),
          ),
          titleText("Suggested For You"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.topGames.map((e) => gameContainer(e)).toList(),
            ),
          ),
          titleText("Editors' Choice games"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.allGames.map((e) => gameContainer(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TopChartGames extends StatefulWidget {
  const TopChartGames({Key? key}) : super(key: key);

  @override
  State<TopChartGames> createState() => _TopChartGamesState();
}

class _TopChartGamesState extends State<TopChartGames> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: Global.topGames.length,
        itemBuilder: (context, i) {
          return topContainer(Global.topGames, i);
        },
      ),
    );
  }
}
