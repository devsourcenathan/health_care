import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/widgets/my_button.dart';
import 'package:medical_project/widgets/my_text_field.dart';

class DoctorInfo extends StatefulWidget {
  final user;
  DoctorInfo({super.key, this.user});

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  final _numberController = TextEditingController();
  final _hospitalController = TextEditingController();
  final _specialtyController = TextEditingController();
  final _yearsController = TextEditingController();
  final _certificateController = TextEditingController();

  Future<void> _updateData() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('uid', isEqualTo: widget.user['uid'])
        .get();

    if (snapshot.docs.isNotEmpty) {
      final DocumentSnapshot<Map<String, dynamic>> document =
          snapshot.docs.first;
      await document.reference.update({
        'matriculation': _numberController.text,
        'hospital': _hospitalController.text,
        'specialty': _specialtyController.text,
        'years': _yearsController.text,
        'certificate': _certificateController.text
      });
      Navigator.pop(context);
      print('Document mis à jour');
    } else {
      print('Aucun document trouvé');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "Mes informations",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text(
                      "Immatriculation a l'ordre des medecins",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  MyTextField(
                    controller: _numberController,
                    hintText: widget.user['matriculation'] ?? "",
                    obscureText: false,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text(
                      "Hopital actuel",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  MyTextField(
                    controller: _hospitalController,
                    hintText: widget.user['hospital'] ?? "",
                    obscureText: false,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text(
                      "Votre specialite",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  MyTextField(
                    controller: _specialtyController,
                    hintText: widget.user['specialty'] ?? "",
                    obscureText: false,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text(
                      "Annee d'experiences",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  MyTextField(
                    controller: _yearsController,
                    hintText: widget.user['years'] ?? "",
                    obscureText: false,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text(
                      "Certificat d'etude",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  MyTextField(
                    controller: _certificateController,
                    hintText: widget.user['certificate'] ?? "",
                    obscureText: false,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () {
                  _updateData();
                },
                text: "Enregistrer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
