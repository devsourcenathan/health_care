import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  Future getDoctors() async {
    await FirebaseFirestore.instance.collection('doctors').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            print(element.reference);
          }),
        );
  }

  @override
  void initState() {
    getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Text("test")]),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Home")]),
    );
  }
}
