import 'package:FindMyLab/modules/appointment_card.dart';
import 'package:flutter/material.dart';

import '../modules/appointment.dart';
import '../modules/appointment_card.dart';

class OwnerDashboard extends StatefulWidget {
  @override
  _OwnerDashboardState createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {

  List<Appointment> appointments = [
    Appointment(patientName: 'Surbhi', patientSlot: '9 - 10'),
    Appointment(patientName: 'Rashmi', patientSlot: '10 - 11'),
    Appointment(patientName: 'Tanushree', patientSlot: '9 - 10')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner dashboard'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        child: Column(
          children: appointments.map((appointment) => AppointmentCard(appointment: appointment)).toList(),
        )
      )
    );
  }
}
