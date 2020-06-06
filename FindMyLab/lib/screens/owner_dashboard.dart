import 'package:FindMyLab/modules/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import '../modules/appointment.dart';
import '../modules/appointment_card.dart';

class OwnerDashboard extends StatefulWidget {
  @override
  _OwnerDashboardState createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {

  List<Appointment> appointments = [
    Appointment(patientName: 'Divya Sharma', patientSlot: '9 - 10',hospitalName: 'Tata Main Hospital',contactNumber: '9876543211'),
    Appointment(patientName: 'Anshika Gupta', patientSlot: '10 - 11',hospitalName: 'Sakra Hospital',contactNumber:'0987654321'),
    Appointment(patientName: 'Swati Agarwal', patientSlot: '1 - 2',hospitalName: 'Bellandur Main Hospital',contactNumber: '8765432109'),
    Appointment(patientName: 'Tanisha Capriana', patientSlot: '12 - 1',hospitalName: 'Tata Main Hospital',contactNumber : '9876543212'),
    Appointment(patientName: 'Tamanna Taneja', patientSlot: '4 - 5',hospitalName: 'Sakra Hospital', contactNumber: '7654321890'),
    Appointment(patientName: 'Ishant Kapoor', patientSlot: '1 - 2',hospitalName: 'Apollo Clinic',contactNumber: '6543217891'),
    Appointment(patientName: 'Manav Mehra', patientSlot: '6 - 7',hospitalName: 'Bellandur Main Hospital',contactNumber: '9876543211'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner dashboard'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: Scrollbar(
        child:SingleChildScrollView(
    dragStartBehavior: DragStartBehavior.down,
    child: Container(
        child: Column(
          children: appointments.map((appointment) => AppointmentCard(appointment: appointment)).toList(),
        )
      )
      )
    ));
  }
}
