import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/screens/appointment_screen.dart';
import 'package:medical_project/screens/doctors/doctor_screen.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/text.dart';

class HomeScreen extends StatelessWidget {
  List symptoms = [
    "Temperature",
    "Snuffle",
    "Fever",
    "Cough",
    "Cold",
  ];

  List specialty = [
    'Cardiologie',
    'Chirurgie',
    'Dentiste',
    'Dermatologie',
    'Génécologie',
    'Hématolologie',
    'Neurologie',
    'Ophtamologie',
    'ORL',
    'Pédiatrie',
    'Psychiatrie',
    'Radiologie',
    'Rhumatologie',
    'Urologie',
    'Médecine Générale'
  ];

  List specialityImg = [
    "2.png",
    "3.png",
    "4.png",
    "5.png",
    "1.png",
    "6.png",
    "6.png",
    "4.png",
    "5.png",
    "3.png",
  ];

  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor4.jpg",
    "doctor2.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("lib/images/profile/doc.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: primary,
                            size: 35,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          clinicVisitText,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          clinicVisitSubtitleText,
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF0EEFA),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.home_filled,
                            color: primary,
                            size: 35,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          homeVisitText,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          homeVisitSubtitleText,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // const Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Text(
            //     "What are your symptoms?",
            //     style: TextStyle(
            //       fontSize: 23,
            //       fontWeight: FontWeight.w500,
            //       color: Colors.black54,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 70,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: symptoms.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         margin: const EdgeInsets.symmetric(
            //             horizontal: 15, vertical: 10),
            //         padding: const EdgeInsets.symmetric(horizontal: 25),
            //         decoration: BoxDecoration(
            //           color: const Color(0xFFF4F6FA),
            //           borderRadius: BorderRadius.circular(10),
            //           boxShadow: const [
            //             BoxShadow(
            //               color: Colors.black12,
            //               blurRadius: 4,
            //               spreadRadius: 2,
            //             ),
            //           ],
            //         ),
            //         child: Center(
            //           child: Text(
            //             symptoms[index],
            //             style: const TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w500,
            //               color: Colors.black54,
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                specialtyTitleText,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: specialty.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DoctorsScreen(specialty: specialty[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 15),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                              "lib/images/specialities/${specialityImg[index]}"),
                        ),
                        Text(
                          specialty[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        // const Text(
                        //   "Therapist",
                        //   style: TextStyle(
                        //     color: Colors.black45,
                        //   ),
                        // ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: const [
                        //     Icon(
                        //       Icons.star,
                        //       color: Colors.amber,
                        //     ),
                        //     Text(
                        //       "4.9",
                        //       style: TextStyle(
                        //         color: Colors.black45,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
