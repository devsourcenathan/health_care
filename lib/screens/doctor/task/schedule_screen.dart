import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/screens/appointment_screen.dart';
import 'package:medical_project/screens/doctor/task/schedule_item.dart';
import 'package:medical_project/screens/shedule/schedule_item.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/widgets/upcoming_schedule.dart';

class DoctorScheduleScreen extends StatefulWidget {
  @override
  State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
}

class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Vos Rendez-vous",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("appointments")
                  .where("doctorUid", isEqualTo: user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("Vous n'avez pas de rendez-vous"),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return DoctorScheduleItem(
                      schedule: snapshot.data!.docs[index],
                    );
                  },
                );
              },
            ),
            // Widgets According to buttons
          ],
        ),
      ),
    );
  }
}
