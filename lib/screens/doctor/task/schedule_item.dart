import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/screens/doctor/task/patient_screen.dart';
import 'package:medical_project/utils/color.dart';

class DoctorScheduleItem extends StatefulWidget {
  final schedule;
  DoctorScheduleItem({super.key, this.schedule});

  @override
  State<DoctorScheduleItem> createState() => _DoctorScheduleItem();
}

class _DoctorScheduleItem extends State<DoctorScheduleItem> {
  late User _currentUser;
  late Stream<QuerySnapshot<Map<String, dynamic>>> _userStream;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser!;
    _userStream = FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: widget.schedule['patientUid'])
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _userStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final userData = snapshot.data!.docs.first.data();
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        userData['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage("lib/images/doctors/doctor1.jpg"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        // color: Colors.black,
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text(
                              widget.schedule['date'],
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text(
                              widget.schedule['time'],
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.schedule['status'],
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F6FA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Annuler",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PatientScreen(user: userData)));
                          },
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Details",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
