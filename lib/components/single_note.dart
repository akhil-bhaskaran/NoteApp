import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:noteboy/components/styles.dart';

class SingleNote extends StatefulWidget {
  const SingleNote({super.key});

  @override
  State<SingleNote> createState() => _SingleNoteState();
}

class _SingleNoteState extends State<SingleNote> {
  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: ListTile(
          title: Text(
            "Hello",
            style: TextStyle(color: titlecolor),
          ),
          subtitle: Text(
            "My name is",
            style: TextStyle(color: titlecolor),
          )),
    ));
  }
}
