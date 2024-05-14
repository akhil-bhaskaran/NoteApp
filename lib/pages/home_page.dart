import 'package:flutter/material.dart';
import 'package:noteboy/components/single_note.dart';
import 'package:noteboy/components/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Notez",
          style: TextStyle(fontSize: 34),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const SingleNote(),
        itemCount: 2,
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(53),
              bottomRight: Radius.circular(57),
              topLeft: Radius.circular(57),
              topRight: Radius.circular(54)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.5, left: 2.5),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: bgcolor,
            elevation: 5,
            child: const Icon(Icons.add, size: 30),
          ),
        ),
      ),
    );
  }
}
