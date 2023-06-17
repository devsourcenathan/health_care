import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/screens/appointment_screen.dart';
import 'package:medical_project/screens/shedule/schedule_screen.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/string_utils.dart';
import 'package:medical_project/widgets/upcoming_schedule.dart';

class DoctorsScreen extends StatelessWidget {
  final String specialty;
  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];
  List specialties = ["Dentistes", "2", "4", "3"];

  DoctorsScreen({super.key, required this.specialty});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.black,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("doctors")
                            .where("specialty",
                                isEqualTo: specialty.toLowerCase())
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AppointmentScreen(
                                          doctor: snapshot.data!.docs[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: DoctorTile(
                                    image: snapshot.data!.docs[index]['image'],
                                    name: snapshot.data!.docs[index]['name'],
                                    specialty: snapshot.data!.docs[index]
                                        ['specialty'],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(40),
                                margin: const EdgeInsets.only(top: 40),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Pas de medecin disponible pour cette specialite...",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      margin: const EdgeInsets.all(10),
                                      color: primary,
                                      child: const Text(
                                        "Retourner a l'accueil",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  // DoctorTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorTile extends StatelessWidget {
  final String image;
  final String name;
  final String specialty;
  DoctorTile({
    super.key,
    required this.image,
    required this.name,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            child: SizedBox(
              height: 55,
              width: 55,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(image),
              ),
            ),
          ),
          title: Text(
            "Dr $name",
            // style: TextStyles.title.bold,
          ),
          subtitle: Text(
            specialty.capitalize(),
            // model.type,
            // style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
