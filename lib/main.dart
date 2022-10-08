import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.red, primary: Colors.red),
      ),
      routes: {
        '/': (context) => home(),
      },
    ),
  );
}

int initialstepvalue = 0;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

final GlobalKey<FormState> controller = GlobalKey<FormState>();

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Stepper App"),
      ),
      body: Form(
        key: controller,
        child: Stepper(
            type: StepperType.vertical,
            elevation: 0,
            physics: BouncingScrollPhysics(),
            currentStep: initialstepvalue,
            onStepTapped: (val) {
              setState(() {
                initialstepvalue = val;
              });
            },
            onStepContinue: () {
              if (initialstepvalue == 2) {
                if (controller.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("You Data Is Save")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("You Data Is Missing"),
                    backgroundColor: Colors.red,
                  ));
                }
              }
              if (initialstepvalue <= 1) {
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
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.red)),
                          onPressed: details.onStepContinue,
                          child: (initialstepvalue == 2)
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
                  state: (initialstepvalue == 0)
                      ? StepState.complete
                      : StepState.indexed,
                  isActive: (initialstepvalue >= 0) ? true : false,
                  title: Text("SingUp"),
                  content: Column(
                    children: [
                      TextFormField(
                        // controller: namecontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter you Full Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "Full name"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // controller: namecontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter You Emaile";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "Email-Id"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // controller: namecontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter You Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "Password*"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // controller: namecontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter You Confrom Password";
                          }
                          return null;
                        },
                        decoration:
                            InputDecoration(hintText: "Confrom Password*"),
                      )
                    ],
                  )),
              Step(
                  state: (initialstepvalue == 1)
                      ? StepState.complete
                      : StepState.indexed,
                  isActive: (initialstepvalue >= 1) ? true : false,
                  title: Text("Login"),
                  content: Column(
                    children: [
                      TextFormField(
                          // controller: diccontroller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter You User Name*";
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: "User Name*")),
                      SizedBox(height: 20),
                      TextFormField(
                          // controller: diccontroller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter You Password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: "Password*"))
                    ],
                  )),
              Step(
                  state: (initialstepvalue == 2)
                      ? StepState.complete
                      : StepState.indexed,
                  isActive: (initialstepvalue >= 2) ? true : false,
                  title: Text("Home"),
                  content: TextFormField(
                      // controller: phonenamecontroller,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter you ";
                        }

                        return null;
                      },
                      decoration: InputDecoration(hintText: "Enter You"))),
            ]),
      ),
    );
  }
}
