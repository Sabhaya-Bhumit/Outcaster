import 'package:flutter/cupertino.dart';

import '../widgets.dart';

class SearchPageIOS extends StatefulWidget {
  const SearchPageIOS({Key? key}) : super(key: key);

  @override
  State<SearchPageIOS> createState() => _SearchPageIOSState();
}

class _SearchPageIOSState extends State<SearchPageIOS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: CupertinoColors.white,
        child: Column(
          children: [
            Expanded(
              child: titleTextCupertino("Search", context),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CupertinoSearchTextField(
                      padding: const EdgeInsets.all(12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
