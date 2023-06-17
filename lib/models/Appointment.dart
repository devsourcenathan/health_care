import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String name;
  final DateTime time;
  final String service;
  final String id;
  String status;
  final String userId;
  final String medecinId;

  Appointment({
    required this.name,
    required this.time,
    required this.service,
    required this.id,
    required this.userId,
    required this.medecinId,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
        name: json['name'],
        time: (json['time']).toDate(),
        service: json['service'],
        status: json['status'],
        medecinId: json['medecinId'],
        userId: json['userId'],
        id: json['id']);
  }

  toJson() {
    return {
      'name': name,
      'service': service,
      'time': Timestamp.fromDate(time),
      'status': status,
      'id': id,
      'userId': userId,
      'medecinId': medecinId,
    };
  }
}
