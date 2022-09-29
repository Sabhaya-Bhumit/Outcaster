import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_1/global.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ),
  );
}

TextStyle fontstyle =
    TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold);
TextStyle iosstyl =
    TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold);
TextStyle text = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

Widget allrow(
        {required IconData icon,
        required String name,
        required String subname}) =>
    ListTile(
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
      title: Text(
        "$name",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text("$subname"),
    );

Widget accounts({required IconData icon, required String name}) => Row(
      children: [
        SizedBox(width: 20),
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(width: 20),
        Text("$name",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18))
      ],
    );
Widget iosc({
  required IconData icon,
  required String name,
  required String subname,
}) =>
    Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(width: 20),
          Text("$name"),
          Spacer(),
          Text("$subname"),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey,
          ),
          SizedBox(width: 10),
        ],
      ),
    );

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return (global.isios == false)
        ? Scaffold(
            appBar: AppBar(
                title: Text("Settings UI"),
                backgroundColor: Colors.red,
                actions: [
                  Switch(
                      value: global.isios,
                      onChanged: (val) {
                        setState(() {
                          global.isios = val;
                        });
                      })
                ],
                elevation: 0),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text("     Common", style: fontstyle),
                  SizedBox(height: 5),
                  allrow(
                      icon: Icons.network_check_sharp,
                      name: "Language",
                      subname: "English"),
                  Divider(),
                  SizedBox(height: 5),
                  allrow(
                      icon: Icons.cloud_outlined,
                      name: "Environment",
                      subname: "Production"),
                  SizedBox(height: 10),
                  Text("    Account", style: fontstyle),
                  SizedBox(height: 25),
                  accounts(icon: Icons.phone, name: "phone number"),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  accounts(icon: Icons.email, name: "Email"),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  accounts(icon: Icons.exit_to_app, name: "Sing out"),
                  SizedBox(height: 20),
                  Text("     Secutiry", style: fontstyle),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.screen_lock_portrait),
                      SizedBox(width: 20),
                      Text(
                        "Loock app in backgraound",
                        style: text,
                      ),
                      Spacer(),
                      Switch(
                          activeColor: Colors.red,
                          value: global.lock,
                          onChanged: (val) {
                            setState(() {
                              global.lock = val;
                            });
                          }),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.screen_lock_portrait),
                      SizedBox(width: 20),
                      Text(
                        "Use fingerprint",
                        style: text,
                      ),
                      Spacer(),
                      Switch(
                          activeColor: Colors.red,
                          value: global.use,
                          onChanged: (val) {
                            setState(() {
                              global.use = val;
                            });
                          }),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.screen_lock_portrait),
                      SizedBox(width: 20),
                      Text(
                        "Change password",
                        style: text,
                      ),
                      Spacer(),
                      Switch(
                          activeColor: Colors.red,
                          value: global.change,
                          onChanged: (val) {
                            setState(() {
                              global.change = val;
                            });
                          }),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("    Misc", style: fontstyle),
                ],
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Colors.red,
                middle: Text(
                  "Setting UI",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                trailing: CupertinoSwitch(
                    value: global.isios,
                    onChanged: (val) {
                      setState(() {
                        global.isios = val;
                      });
                    }),
              ),
              backgroundColor: Color(0xfff3eff9),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text("     Common", style: iosstyl),
                    SizedBox(height: 5),
                    iosc(
                        icon: Icons.network_wifi,
                        name: "Language",
                        subname: "English"),
                    iosc(
                        icon: Icons.cloud_outlined,
                        name: "Environment",
                        subname: "Production"),
                    SizedBox(height: 20),
                    Text("     Account", style: iosstyl),
                    SizedBox(height: 5),
                    iosc(icon: Icons.phone, name: "phone Number ", subname: ""),
                    iosc(icon: Icons.email, name: "Email", subname: ""),
                    iosc(
                        icon: Icons.exit_to_app, name: "Sing Out", subname: ""),
                    SizedBox(height: 20),
                    Text("     Secutiry", style: iosstyl),
                    SizedBox(height: 5),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.screen_lock_portrait,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 20),
                          Text("Lock app in background"),
                          Spacer(),
                          CupertinoSwitch(
                              activeColor: Colors.red,
                              value: global.lock,
                              onChanged: (val) {
                                setState(() {
                                  global.lock = val;
                                });
                              }),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.fingerprint,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 20),
                          Text("Use Fingerprint"),
                          Spacer(),
                          CupertinoSwitch(
                              activeColor: Colors.red,
                              value: global.use,
                              onChanged: (val) {
                                setState(() {
                                  global.use = val;
                                });
                              }),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 20),
                          Text("Change password"),
                          Spacer(),
                          CupertinoSwitch(
                              activeColor: Colors.red,
                              value: global.change,
                              onChanged: (val) {
                                setState(() {
                                  global.change = val;
                                });
                              }),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("     Misc", style: iosstyl),
                    SizedBox(height: 5),
                    iosc(
                        icon: Icons.document_scanner,
                        name: "Terms Of Service",
                        subname: ""),
                    iosc(
                        icon: Icons.save,
                        name: "Open source licenses",
                        subname: ""),
                  ],
                ),
              ),
            ),
          );
  }
}
