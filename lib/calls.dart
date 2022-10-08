import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:platform_convertor_app/global.dart';
import 'package:url_launcher/url_launcher.dart';

class callscomponet extends StatefulWidget {
  const callscomponet({Key? key}) : super(key: key);

  @override
  State<callscomponet> createState() => _callscomponetState();
}

class _callscomponetState extends State<callscomponet> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, i) => ListTile(
            title: Text("${global.all_contact[i]['name']}"),
            leading: (global.all_contact[i]['image'] != null)
                ? CircleAvatar(
                    radius: 31,
                    backgroundImage: FileImage(global.all_contact[i]['image']),
                  )
                : ProfilePicture(
                    name: '${global.all_contact[i]['name']}',
                    radius: 31,
                    fontsize: 21,
                    random: false,
                  ),
            subtitle: Text("${global.all_contact[i]['time']}"),
            trailing: IconButton(
                onPressed: () async {
                  Uri uri =
                      Uri.parse("tel:+91${global.all_contact[i]['phone']}");
                  try {
                    await launchUrl(uri);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("cannot be posible due to $e"),
                      backgroundColor: Colors.redAccent,
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
                icon: Icon(Icons.call))),
        itemCount: global.all_contact.length);
  }
}
