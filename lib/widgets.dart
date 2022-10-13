import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

titleText(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_outlined),
        const SizedBox(width: 20),
      ],
    ),
  );
}

Widget appContainer(e) {
  return Container(
    padding: const EdgeInsets.only(right: 10),
    width: 110,
    height: 150,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.05),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: NetworkImage(
                e["image"].toString(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "${e["name"]}",
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        )
      ],
    ),
  );
}

topContainer(listName, i) {
  return SizedBox(
    height: 80,
    child: Row(
      children: [
        Text("${i + 1}"),
        const SizedBox(width: 20),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.05),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                listName[i]["image"].toString(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 13),
            Text(
              listName[i]["name"].toString(),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 3),
            Text(
              listName[i]["cat"].toString(),
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const Spacer(),
          ],
        )
      ],
    ),
  );
}

Widget gameContainer(e) {
  return Container(
    padding: const EdgeInsets.only(right: 10),
    width: 250,
    height: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 240,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.05),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                e["image"].toString(),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${e["name"]}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "${e["cat"]}",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget movieContainer(e) {
  return Container(
    padding: const EdgeInsets.only(right: 10),
    width: 170,
    height: 350,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 160,
          height: 255,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.05),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                e["image"].toString(),
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${e["name"]}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "${e["cat"]}",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

titleTextCupertino(String title, context) {
  return Container(
    padding: const EdgeInsets.all(12),
    alignment: Alignment.bottomLeft,
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
    ),
  );
}

Widget iosApp(e, context, up) {
  return Container(
    margin: const EdgeInsets.all(4),
    height: 90,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: CupertinoColors.systemBlue.withOpacity(0.01),
    ),
    child: Row(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: CupertinoColors.systemBlue.withOpacity(0.05),
            border: Border.all(color: CupertinoColors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                e["image"].toString(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "${e["name"]}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              Text(
                (e["cat"] == null) ? "" : "${e["cat"]}",
                style: const TextStyle(fontSize: 15),
              ),
              const Spacer(),
            ],
          ),
        ),
        const Spacer(),
        (up == "up")
            ? SizedBox(
                height: 30,
                width: 70,
                child: CupertinoButton(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(25),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      color: CupertinoColors.systemBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: 30,
                width: 70,
                child: CupertinoButton(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(25),
                  child: const Text(
                    "GET",
                    style: TextStyle(
                      color: CupertinoColors.systemBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
        const Spacer(),
      ],
    ),
  );
}
