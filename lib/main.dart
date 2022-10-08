import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outcaster_5/global.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

File? imgfile;
final GlobalKey<FormState> controller = GlobalKey<FormState>();
final TextEditingController namecontroller = TextEditingController();
final TextEditingController phonecontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController dobcontroller = TextEditingController();
final TextEditingController gendercontroller = TextEditingController();
final TextEditingController curremtcontroller = TextEditingController();
final TextEditingController nationalitiescontroller = TextEditingController();
final TextEditingController Religioncontroller = TextEditingController();
final TextEditingController languagecontroller = TextEditingController();
final TextEditingController biographycontroller = TextEditingController();
int initialstepvalue = 0;

ImagePicker picker = ImagePicker();

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xff52b6f9), Color(0xff9ae7a3)])),
        ),
        leading: Icon(Icons.arrow_back_sharp),
        title: Text("Edit Your Profile"),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                      if (initialstepvalue == 10) {
                        if (controller.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text("You Data Is Save"),
                            backgroundColor: Colors.green,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text("You Data Is Missing"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }
                      if (initialstepvalue <= 9) {
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
                                  child: (initialstepvalue == 10)
                                      ? Text("OK")
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
                              backgroundImage: (imgfile != null)
                                  ? FileImage(imgfile!)
                                  : null,
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
                                                          source: ImageSource
                                                              .camera);

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
                                return "Enter You Name";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                hintText: "Enter You name"),
                          )),
                      Step(
                          isActive: (initialstepvalue >= 2) ? true : false,
                          title: Text("phone"),
                          content: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: phonecontroller,
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
                          title: Text("Email"),
                          content: TextFormField(
                              controller: emailcontroller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you Email";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter You Email ID"))),
                      Step(
                          isActive: (initialstepvalue >= 4) ? true : false,
                          title: Text("DOB"),
                          content: TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: dobcontroller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you DOB";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter You DOB"))),
                      Step(
                          isActive: (initialstepvalue >= 5) ? true : false,
                          title: Text("Gender"),
                          content: TextFormField(
                              controller: gendercontroller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you gender";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter You Gender"))),
                      Step(
                          isActive: (initialstepvalue >= 6) ? true : false,
                          title: Text("Curremt Location"),
                          content: TextFormField(
                              controller: curremtcontroller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter you Curremt Location";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter You Curremt Loction"))),
                      Step(
                          isActive: (initialstepvalue >= 7) ? true : false,
                          title: Text("Nationalities"),
                          content: TextFormField(
                              controller: nationalitiescontroller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter You Nationalities";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter You Nationalities"))),
                      Step(
                          isActive: (initialstepvalue >= 8) ? true : false,
                          title: Text("Religion"),
                          content: TextFormField(
                              controller: Religioncontroller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter You Religion";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter You Religion"))),
                      Step(
                          isActive: (initialstepvalue >= 9) ? true : false,
                          title: Text("Language"),
                          content: TextFormField(
                              controller: languagecontroller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter You Language";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter You Language"))),
                      Step(
                          isActive: (initialstepvalue >= 10) ? true : false,
                          title: Text("Biography"),
                          content: TextFormField(
                              controller: biographycontroller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter You Biography";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter You Biography"))),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
