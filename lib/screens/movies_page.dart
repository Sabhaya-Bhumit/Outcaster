import 'package:flutter/material.dart';
import 'package:outcaster_3/widgets.dart';

import '../global.dart';

class ForYouMovies extends StatefulWidget {
  const ForYouMovies({Key? key}) : super(key: key);

  @override
  State<ForYouMovies> createState() => _ForYouMoviesState();
}

class _ForYouMoviesState extends State<ForYouMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: ListView(
        children: [
          titleText("Suggested For You"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.topMovie.map((e) => movieContainer(e)).toList(),
            ),
          ),
          titleText("Top Seller Movie"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  Global.topSellerMovies.map((e) => movieContainer(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TopChartMovies extends StatefulWidget {
  const TopChartMovies({Key? key}) : super(key: key);

  @override
  State<TopChartMovies> createState() => _TopChartMoviesState();
}

class _TopChartMoviesState extends State<TopChartMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: Global.topMovie.length,
        itemBuilder: (context, i) {
          return topContainer(Global.topMovie, i);
        },
      ),
    );
  }
}
