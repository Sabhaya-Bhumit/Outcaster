import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor_app/calls.dart';
import 'package:platform_convertor_app/chats.dart';
import 'package:platform_convertor_app/global.dart';
import 'package:platform_convertor_app/settings.dart';

import 'drawer.dart';

void main() {
  runApp(
    home(),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  late TabController tabController;
  PageController pageController = PageController();
  int initialtabindex = 0;
  int initialbottomnavigationbaritemindex = 0;

  List<Widget> pages = [
    chatscomponet(),
    callscomponet(),
    settingcomponet(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
    imgfile = null;
    global.myimage = null;
    tabController.addListener(() {
      setState(() {
        initialtabindex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (global.isios == true)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Builder(
                  builder: (context) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            drawer();
                          });
                        },
                        child: Icon(Icons.list));
                  },
                ),
                middle: Text("Platform Convertor"),
                trailing: CupertinoSwitch(
                    value: global.isios,
                    onChanged: (val) {
                      setState(() {
                        global.isios = val;
                      });
                    }),
              ),
              child: CircleAvatar(),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Colors.blueGrey, secondary: Colors.blueGrey)),
            home: Scaffold(
              //bottom bar
              // bottomNavigationBar: BottomNavigationBar(
              //   currentIndex: initialbottomnavigationbaritemindex,
              //   onTap: (val) {
              //     setState(() {
              //       initialbottomnavigationbaritemindex = val;
              //       pageController.animateToPage(val,
              //           duration: Duration(milliseconds: 1000),
              //           curve: Curves.easeInCubic);
              //     });
              //   },
              //   backgroundColor: Colors.white,
              //   items: <BottomNavigationBarItem>[
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.chat),
              //         activeIcon: Icon(Icons.home),
              //         label: "chats"),
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.call),
              //         activeIcon: Icon(Icons.home),
              //         label: "Calls"),
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.settings),
              //         activeIcon: Icon(Icons.home),
              //         label: "Sattings"),
              //   ],
              // ),
              appBar: AppBar(
                title: Text("Paltform Convertor"),
                elevation: 0,
                actions: [
                  Switch(
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.white,
                      value: global.isios,
                      onChanged: (val) {
                        setState(() {
                          global.isios = val;
                        });
                      }),
                ],
                //tab bar
                bottom: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.white,
                  indicatorWeight: 5,
                  onTap: (val) {
                    setState(() {
                      pageController.animateToPage(val,
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.bounceOut);
                      initialbottomnavigationbaritemindex = val;
                    });
                  },
                  tabs: <Tab>[
                    Tab(text: "CHATS"),
                    Tab(text: "CALLS"),
                    Tab(text: "SETTINGS"),
                  ],
                ),
              ),
              //drawer
              drawer: Drawer(
                child: drawer(),
              ),
              floatingActionButton: (initialtabindex == 0)
                  //floating action button
                  ? floating()
                  : null,

              //body
              body: PageView.builder(
                  controller: pageController,
                  onPageChanged: (val) {
                    setState(() {
                      tabController.animateTo(val);
                      initialbottomnavigationbaritemindex = val;
                    });
                  },
                  itemBuilder: (context, i) => pages[i],
                  itemCount: pages.length),
            ));
  }
}

class floating extends StatefulWidget {
  const floating({Key? key}) : super(key: key);

  @override
  State<floating> createState() => _floatingState();
}

final GlobalKey<FormState> controller = GlobalKey<FormState>();
final TextEditingController namecontroller = TextEditingController();
final TextEditingController diccontroller = TextEditingController();
final TextEditingController phonenamecontroller = TextEditingController();
final TextEditingController timecontroller = TextEditingController();

final ImagePicker picker = ImagePicker();
File? imgfile;
int initialstepvalue = 0;

class _floatingState extends State<floating> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    namecontroller.clear();
    diccontroller.clear();
    phonenamecontroller.clear();
    timecontroller.clear();
    initialstepvalue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        setState(() {
          imgfile = null;
          global.myimage = null;
          showDialog(context: context, builder: (context) => alitDiloag());
        });
      },
    );
  }
}

class alitDiloag extends StatefulWidget {
  const alitDiloag({Key? key}) : super(key: key);

  @override
  State<alitDiloag> createState() => _alitDiloagState();
}

class _alitDiloagState extends State<alitDiloag> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      height: 600,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: controller,
              child: Stepper(
                  currentStep: initialstepvalue,
                  onStepTapped: (val) {
                    setState(() {
                      initialstepvalue = val;
                    });
                  },
                  onStepContinue: () {
                    if (initialstepvalue == 4) {
                      if (controller.currentState!.validate()) {
                        String name = namecontroller.text;
                        String dec = diccontroller.text;
                        String time = timecontroller.text;
                        String phone = phonenamecontroller.text;
                        File? images = global.myimage;
                        Map<String, dynamic> new_contact = {
                          'name': name,
                          'dec': dec,
                          'time': time,
                          'phone': phone,
                          'image': images,
                        };
                        global.all_contact.add(new_contact);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("You Data Is Save")),
                        );
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("You Data Is Missing"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                    if (initialstepvalue <= 3) {
                      setState(() {
                        ++initialstepvalue;
                      });
                    }
                  },
                  onStepCancel: () {
                    if (initialstepvalue > 0) {
                      setState(() {
                        --initialstepvalue;
                      });
                    }
                  },
                  controlsBuilder: (context, details) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: details.onStepContinue,
                                child: (initialstepvalue == 4)
                                    ? Text("ADD ")
                                    : Text("NEXT")),
                            SizedBox(width: 10),
                            (initialstepvalue <= 0)
                                ? Container()
                                : OutlinedButton(
                                    onPressed: details.onStepCancel,
                                    child: Text("CANCEL")),
                          ],
                        ),
                      ),
                  steps: <Step>[
                    Step(
                      isActive: (initialstepvalue >= 0) ? true : false,
                      title: Text("Photo"),
                      content: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                (imgfile != null) ? FileImage(imgfile!) : null,
                          ),
                          Positioned(
                              top: 50,
                              child: (imgfile == null)
                                  ? Text(
                                      "Add Photo       ",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  : Text("")),
                          FloatingActionButton(
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: SelectableText(
                                            "You Choise Is Image"),
                                        actions: [
                                          IconButton(
                                              onPressed: () async {
                                                XFile? image =
                                                    await picker.pickImage(
                                                        source:
                                                            ImageSource.camera);

                                                setState(() {
                                                  imgfile = File(image!.path);
                                                  global.myimage = imgfile;

                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              icon: Icon(Icons.camera)),
                                          SizedBox(width: 40),
                                          IconButton(
                                              onPressed: () async {
                                                XFile? image =
                                                    await picker.pickImage(
                                                        source: ImageSource
                                                            .gallery);

                                                setState(() {
                                                  imgfile = File(image!.path);
                                                  global.myimage = imgfile;

                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              icon: Icon(Icons.album))
                                        ],
                                      ));
                            },
                            child: Icon(Icons.add),
                            mini: true,
                          )
                        ],
                      ),
                    ),
                    Step(
                        isActive: (initialstepvalue >= 1) ? true : false,
                        title: Text("Name"),
                        content: TextFormField(
                          controller: namecontroller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter you Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter you name"),
                        )),
                    Step(
                        isActive: (initialstepvalue >= 2) ? true : false,
                        title: Text("Description"),
                        content: TextFormField(
                            controller: diccontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter you dec..";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter you Dec."))),
                    Step(
                        isActive: (initialstepvalue >= 3) ? true : false,
                        title: Text("Phone Number"),
                        content: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phonenamecontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter you Phone Number";
                              }
                              if (val.length < 10) {
                                return "You Phone Number Are Missing To Number";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter you Phone Number"))),
                    Step(
                        isActive: (initialstepvalue >= 4) ? true : false,
                        title: Text("Time"),
                        content: TextFormField(
                            controller: timecontroller,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()))),
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}
