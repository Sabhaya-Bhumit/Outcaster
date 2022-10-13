import 'package:flutter/cupertino.dart';

import '../global.dart';
import '../widgets.dart';

class GamePageIOS extends StatefulWidget {
  const GamePageIOS({Key? key}) : super(key: key);

  @override
  State<GamePageIOS> createState() => _GamePageIOSState();
}

class _GamePageIOSState extends State<GamePageIOS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: CupertinoColors.white,
        child: Column(
          children: [
            Expanded(
              child: titleTextCupertino("Games", context),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: Global.allGames
                      .map((e) => iosApp(e, context, ""))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
