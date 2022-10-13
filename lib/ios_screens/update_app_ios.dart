import 'package:flutter/cupertino.dart';

import '../global.dart';
import '../widgets.dart';

class UpdatePageIOS extends StatefulWidget {
  const UpdatePageIOS({Key? key}) : super(key: key);

  @override
  State<UpdatePageIOS> createState() => _UpdatePageIOSState();
}

class _UpdatePageIOSState extends State<UpdatePageIOS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: CupertinoColors.white,
        child: Column(
          children: [
            Expanded(
              child: titleTextCupertino("Updates", context),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: Global.updateApp
                      .map((e) => iosApp(e, context, "up"))
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
