import 'package:flutter/cupertino.dart';

import '../global.dart';
import '../widgets.dart';

class AppsPageIOS extends StatefulWidget {
  const AppsPageIOS({Key? key}) : super(key: key);

  @override
  State<AppsPageIOS> createState() => _AppsPageIOSState();
}

class _AppsPageIOSState extends State<AppsPageIOS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: CupertinoColors.white,
        child: Column(
          children: [
            Expanded(
              child: titleTextCupertino("Apps", context),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: Global.allApps
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
