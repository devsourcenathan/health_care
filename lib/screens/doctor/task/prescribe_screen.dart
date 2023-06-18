import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/screens/call/call_page.dart';
import 'package:medical_project/screens/call/prebuild_page.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/params.dart';
import 'package:medical_project/utils/string_utils.dart';
import 'package:medical_project/widgets/my_text_field.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class PrescribeScreen extends StatefulWidget {
  final user;
  PrescribeScreen({super.key, required this.user});

  @override
  State<PrescribeScreen> createState() => _PrescribeScreenState();
}

class _PrescribeScreenState extends State<PrescribeScreen> {
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    Future<void> _updateData() async {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('appointments')
              .where('patientUid', isEqualTo: widget.user['uid'])
              .get();

      if (snapshot.docs.isNotEmpty) {
        final DocumentSnapshot<Map<String, dynamic>> document =
            snapshot.docs.first;
        await document.reference.update({
          'medicament': _nameController.text,
          'medicamentDose': _doseController.text,
          'status': "Terminé",
        });
        Navigator.pop(context);
        print('Document mis à jour');
      } else {
        print('Aucun document trouvé');
      }
    }

    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: SingleChildScrollView(
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
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            // backgroundImage:
                            //     NetworkImage(widget.user['image']),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "M./Mde. " + widget.user['name'],
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (ZegoUIKitPrebuiltCallMiniOverlayMachine()
                                      .isMinimizing) {
                                    /// when the application is minimized (in a minimized state),
                                    /// disable button clicks to prevent multiple PrebuiltCall components from being created.
                                    return;
                                  }

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PrebuiltCallPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white30,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white30,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  CupertinoIcons.chat_bubble_text_fill,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 15,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MyTextField(
                      controller: _nameController,
                      hintText: "Nom du médicament",
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      controller: _doseController,
                      hintText: "Dose du médicament",
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: 130,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                _updateData();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Enregistrer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
