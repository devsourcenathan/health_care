import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_project/models/Doctor.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  List<String> doctorsNames = [];

  Future getDoctors() async {
    await FirebaseFirestore.instance.collection('doctors').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            // print(element.data());
            // doctorsNames.add(element.reference.id.toString());
          }),
        );
  }

  Future getDataOnce_customObjects() async {
    // [START get_data_once_custom_objects]
    final ref = FirebaseFirestore.instance.collection("doctors").withConverter(
          fromFirestore: Doctor.fromFirestore,
          toFirestore: (Doctor doctor, _) => doctor.toFirestore(),
        );
    final docSnap = await ref.get();
    final doctor = docSnap; // Convert to City object
    if (doctor != null) {
      print(doctor);
      doctor.docs.forEach((element) {
        doctorsNames.add(element.data().name.toString());
        print(element.data().name.toString());
      });
    } else {
      print("No such document.");
    }
    // [END get_data_once_custom_objects]
  }

  @override
  void initState() {
    getDoctors();
    getDataOnce_customObjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Text("test")]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Doctors'),
          Container(
            height: 80,
            width: 200,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: doctorsNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.green[200],
                    child: Center(child: Text('${doctorsNames[index]}')),
                  );
                }),
          )
        ],
      ),
    );
  }
}
