import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import '../modules/hospital.dart';
import '../modules/hospital_card.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  List<Hospital> hospitals = [
    Hospital(name: 'Tata Main Hospital', distance: '9 km', slots: ['9AM - 10AM'],contactNumber: '989123456',address:'Indiranagar,Bangalore'),
    Hospital(name: 'Sakra Hospital', distance: '20 km', slots: ['8AM - 9AM'],contactNumber: '9878665533',address: 'Sarjapur Maid Road,Bangalore'),
    Hospital(name: 'Bellandur Main Hospital', distance: '110 km', slots: ['10 AM- 11AM', '1PM - 2PM'],contactNumber: '657743221',address:'Bellendur Main Road, Bangalore'),
    Hospital(name: 'Apollo Clinic', distance: '200 km', slots: ['11AM - 12PM', '3PM - 4PM'],contactNumber: '657743221',address: 'Jayanagar,Bangalore'),
    Hospital(name: 'Columbia Hospital', distance: '334 km', slots: ['Sorry no slots available !'],contactNumber: '657743221',address: 'Bellandur Main Road,Bangalore'),
    Hospital(name: 'Sarjapur main Hospital', distance: '434 km', slots: ['1PM - 2PM','4PM - 5PM'],contactNumber: '9577432332',address:'Sarjapur Main Road,Bangalore'),
    Hospital(name: 'AIMS Hospital', distance: '446 km', slots: ['12PM - 1PM','6PM - 7PM'],contactNumber: '8577432338',address:'JP Nagar, Bangalore'),
    Hospital(name: 'MAX Hospital', distance: '491 km', slots: ['2PM - 3PM','4PM - 5PM'],contactNumber: '9577432338',address:'Koramangala, Bangalore'),
  ];
  @override
  Widget build(BuildContext context) {
    Map userData = {};
    userData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Active Testing Labs'),
        ),
        body:Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            child: Container(
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: hospitals.map((hospital) => HospitalCard(
                  hospital: hospital,
                  bookAppointment: () {
                    setState(() {
                      Navigator.pushNamed(context, '/book_appointment', arguments: {
                        'hospitalName': hospital.name,
                        'slotNumber': hospital.slots[0]
                      });
                    });
                  }
              )).toList(),
            )
        ))
        ));
  }
}

