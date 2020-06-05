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
    Hospital(name: 'Tata Main Hospital', distance: '9', slots: ['9-10', '11-12'],contactNumber: '989123456'),
    Hospital(name: 'Sakra Hospital', distance: '20', slots: ['8-9', '11-12'],contactNumber: '9878665533'),
    Hospital(name: 'Bellandur Main Hospital', distance: '110', slots: ['10-11', '1-2'],contactNumber: '657743221'),
    Hospital(name: 'Apollo Clinic', distance: '200', slots: ['11-12', '3-4'],contactNumber: '657743221'),
    Hospital(name: 'Columbia Hospital', distance: '334', slots: ['No slots available','Check again Later'],contactNumber: '657743221'),
    Hospital(name: 'Sarjapur main Hospital', distance: '434', slots: ['1-2','4-5'],contactNumber: '9577432332'),
    Hospital(name: 'AIMS Hospital', distance: '446', slots: ['12-1','6-7'],contactNumber: '8577432338'),
    Hospital(name: 'MAX Hospital', distance: '491', slots: ['2-3','4-5'],contactNumber: '9577432338'),
  ];
  @override
  Widget build(BuildContext context) {
    Map userData = {};
    userData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('User dashboard'),
        ),
        body:Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            child: Container(

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
        ))
        ));
  }
}

