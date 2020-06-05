import 'package:flutter/material.dart';

import '../modules/hospital.dart';
import '../modules/hospital_card.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  List<Hospital> hospitals = [
    Hospital(name: 'Apollo Spectra Hospitals', address: 'Koramangala 5 Block', distance: 20, slots: ['9-10', '11-12']),
    Hospital(name: 'Nano Hospitals', address: 'Hulimavu',distance: 110, slots: ['9-10', '11-12']),
    Hospital(name: 'Chirag Hospital', address: 'JP Nagar 2 Phase', distance: 50, slots: ['9-10', '11-12'])
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
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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

