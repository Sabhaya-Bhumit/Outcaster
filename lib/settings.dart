import 'package:flutter/material.dart';

class settingcomponet extends StatefulWidget {
  const settingcomponet({Key? key}) : super(key: key);

  @override
  State<settingcomponet> createState() => _settingcomponetState();
}

DateTime initialdate = DateTime.now();
TimeOfDay initialTime = TimeOfDay.now();

String selectedDate = "";
String selectedTime = "";
String month = "";

TextStyle titailSytyle = TextStyle(fontSize: 25, color: Colors.black);

class _settingcomponetState extends State<settingcomponet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (initialdate.month == 1) {
      month = "JAN";
    } else if (initialdate.month == 2) {
      month = "FEB";
    } else if (initialdate.month == 3) {
      month = "MARCH";
    } else if (initialdate.month == 4) {
      month = "APRIL";
    } else if (initialdate.month == 5) {
      month = "MAY";
    } else if (initialdate.month == 6) {
      month = "JUNE";
    } else if (initialdate.month == 7) {
      month = "JULY";
    } else if (initialdate.month == 8) {
      month = "AUG";
    } else if (initialdate.month == 9) {
      month = "SEP";
    } else if (initialdate.month == 10) {
      month = "OCT";
    } else if (initialdate.month == 11) {
      month = "NOV";
    } else if (initialdate.month == 12) {
      month = "DEC";
    }
    selectedDate = "${DateTime.now().day}/${month}/${DateTime.now().year}";
    selectedTime =
        "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}:${DateTime.now().second}  ${TimeOfDay.now().period.name.toUpperCase()}";
  }

  @override
  Widget build(BuildContext context) {
    _selectDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xffef476f), // <-- SEE HERE
                onPrimary: Color(0xffffd166), // <-- SEE HERE
                onSurface: Color(0xff06d6a0), // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    primary: Color(0xff118ab2) // button text color
                    ),
              ),
            ),
            child: child!,
          );
        },
      );
      setState(() {
        if (pickedDate != null) {
          if (pickedDate.month == 1) {
            month = "JAN";
          } else if (pickedDate.month == 2) {
            month = "FEB";
          } else if (pickedDate.month == 3) {
            month = "MARCH";
          } else if (pickedDate.month == 4) {
            month = "APRIL";
          } else if (pickedDate.month == 5) {
            month = "MAY";
          } else if (pickedDate.month == 6) {
            month = "JUNE";
          } else if (pickedDate.month == 7) {
            month = "JULY";
          } else if (pickedDate.month == 8) {
            month = "AUG";
          } else if (pickedDate.month == 9) {
            month = "SEP";
          } else if (pickedDate.month == 10) {
            month = "OCT";
          } else if (pickedDate.month == 11) {
            month = "NOV";
          } else if (pickedDate.month == 12) {
            month = "DEC ";
          }

          selectedDate = "${pickedDate.day} /${month} /${pickedDate.year}";
        }
      });
    }

    _selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: initialTime,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xff780000), // <-- SEE HERE
                onPrimary: Color(0xff4f772d), // <-- SEE HERE
                onSurface: Color(0xfff8961e), // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    primary: Color(0xff003049) // button text color
                    ),
              ),
            ),
            child: child!,
          );
        },
      );
      setState(() {
        if (pickedTime != null) {
          selectedTime =
              "${pickedTime.hour} :${pickedTime.minute} :${DateTime.now().second}  ${pickedTime.period.name.toUpperCase()}";
        }
      });
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DATE",
                  style: titailSytyle,
                ),
                Text(
                  "$selectedDate",
                  style: titailSytyle,
                )
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  return _selectDate(context);
                },
                child: Text("Change Date"),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TIME",
                  style: titailSytyle,
                ),
                Text(
                  "$selectedTime",
                  style: titailSytyle,
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  return _selectTime(context);
                },
                child: Text("Change Date"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
