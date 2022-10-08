import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:platform_convertor_app/global.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class chatscomponet extends StatefulWidget {
  const chatscomponet({Key? key}) : super(key: key);

  @override
  State<chatscomponet> createState() => _chatscomponetState();
}

class _chatscomponetState extends State<chatscomponet> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return ListView.builder(
        itemBuilder: (context, i) => ListTile(
              //rount
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    context: context,
                    builder: (context) => Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                          ),
                          child: Column(
                            children: [
                              //image
                              (global.all_contact[i]['image'] != null)
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage: FileImage(
                                          global.all_contact[i]['image']),
                                    )
                                  : ProfilePicture(
                                      name: '${global.all_contact[i]['name']}',
                                      radius: 60,
                                      fontsize: 35,
                                      random: false,
                                    ),
                              SizedBox(height: 15),
                              Text(
                                "${global.all_contact[i]['name']}",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "+91 ${global.all_contact[i]['phone']}",
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () async {
                                    Uri uri = Uri.parse(
                                        "sms:+91${global.all_contact[i]['phone']}");
                                    try {
                                      await launchUrl(uri);
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text("cannot be posible due to $e"),
                                        backgroundColor: Colors.redAccent,
                                        behavior: SnackBarBehavior.floating,
                                      ));
                                    }
                                  },
                                  child: Text("Send Message"),
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Text("Cancel"),
                                ),
                              ),
                              SizedBox(height: 5),
                              IconButton(
                                  onPressed: () {
                                    Share.share(
                                        "Name =${global.all_contact[i]['name']} \nPhone Number= ${global.all_contact[i]['phone']}");
                                  },
                                  icon: Icon(Icons.share))
                            ],
                          ),
                        ));
              },
              //chats
              title: Text(
                "${global.all_contact[i]['name']}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              leading: (global.all_contact[i]['image'] != null)
                  ? CircleAvatar(
                      radius: 31,
                      backgroundImage:
                          FileImage(global.all_contact[i]['image']),
                    )
                  : ProfilePicture(
                      name: '${global.all_contact[i]['name']}',
                      radius: 31,
                      fontsize: 21,
                      random: false,
                    ),
              subtitle: Text(
                "${global.all_contact[i]['dec']}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              trailing: Text("${global.all_contact[i]['time']}"),
            ),
        itemCount: global.all_contact.length);
  }
}
