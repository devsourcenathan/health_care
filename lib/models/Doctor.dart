import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String? name;
  final String? phone;
  final String? age;
  // final List<String>? regions;

  Doctor({
    this.name,
    this.phone,
    this.age,
    // this.regions,
  });

  factory Doctor.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Doctor(
      name: data?['name'],
      phone: data?['phone'],
      age: data?['age'],
      // regions:data?['regions'] is Iterable ? List.from(data?['regions']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (phone != null) "phone": phone,
      if (age != null) "age": age,
      // if (regions != null) "regions": regions,
    };
  }
}
