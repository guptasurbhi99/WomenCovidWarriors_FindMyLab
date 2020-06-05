import 'package:flutter/material.dart';

import '../modules/hospital.dart';
import '../modules/hospital_card.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  List<Hospital> hospitals = [
    Hospital(name: 'Tata Main Hospital', distance: 100, slots: ['9-10', '11-12']),
    Hospital(name: 'Sakra Hospital', distance: 110, slots: ['9-10', '11-12']),
    Hospital(name: 'Bellandur Main Hospital', distance: 20, slots: ['9-10', '11-12'])
  ];

  @override
  Widget build(BuildContext context) {
    Map userData = {};
    userData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('User dashboard'),
        ),
        body: Container(
            child: Column(
              children: hospitals.map((hospital) => HospitalCard(
                  hospital: hospital,
                  bookAppointment: () {
                    setState(() {
                      Navigator.pushReplacementNamed(context, '/book_appointment', arguments: {
                        'hospitalName': hospital.name,
                        'personName': userData['personName']
                      });
                    });
                  }
              )).toList(),
            )
        )
    );
  }
}

