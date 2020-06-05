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
    Appointment(patientName: 'Surbhi Gupta', patientSlot: '9 - 10'),
    Appointment(patientName: 'Rashmi Patil', patientSlot: '10 - 11'),
    Appointment(patientName: 'Tanushree Bhattacharji', patientSlot: '9 - 10'),
    Appointment(patientName: 'Rashmi Khandai', patientSlot: '12 - 1'),
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
        color: Colors.grey[300],
        child: Column(
          children: appointments.map((appointment) => AppointmentCard(appointment: appointment)).toList(),
        )
      )
    );
  }
}
