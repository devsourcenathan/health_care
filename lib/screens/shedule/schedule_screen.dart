import 'package:flutter/material.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/widgets/upcoming_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _buttonIndex = 0;

  final _scheduleWidgets = [
    UpcomingSchedule(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

          const SizedBox(height: 30),
          // Widgets According to buttons
          UpcomingSchedule()
        ],
      ),
    ));
  }
}
