import 'package:flutter/material.dart';

class Appointment {
  final String doctorUid;
  final String patientUid;
  final DateTime date;
  final String time;
  final String status;

  Appointment({
    required this.doctorUid,
    required this.patientUid,
    required this.date,
    required this.time,
    this.status = 'en attente',
  });

  Map<String, dynamic> toMap() {
    return {
      'doctorUid': doctorUid,
      'patientUid': patientUid,
      'date': date,
      'time': time,
      'status': status,
    };
  }
}
