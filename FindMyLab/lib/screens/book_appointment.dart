import 'package:flutter/material.dart';

import '../modules/hospital.dart';

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Map hospitalData = ModalRoute.of(context).settings.arguments;
    void showInSnackBar(String value) {
      print(_scaffoldKey);
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(value),
      ));
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Patient details'),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
        ),
        body: Card(
            margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(hospitalData['hospitalName'],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[800],
                      )),
                  SizedBox(height: 10.0),
                  Text('Purpose of visit:',
                      style:
                      TextStyle(fontSize: 14.0, color: Colors.grey[600])),
                  Text('Consultation',
                      style:
                      TextStyle(fontSize: 16.0, color: Colors.grey[800])),
                  SizedBox(height: 10.0),
                  Text('This appointment is for:',
                      style:
                          TextStyle(fontSize: 14.0, color: Colors.grey[600])),
                  Text(hospitalData['personName'],
                      style:
                          TextStyle(fontSize: 16.0, color: Colors.grey[800])),
                  SizedBox(height: 10.0),
                  Text('Consultation fees:',
                      style:
                          TextStyle(fontSize: 14.0, color: Colors.grey[600])),
                  Text('INR 500',
                      style:
                          TextStyle(fontSize: 16.0, color: Colors.grey[800])),
                  SizedBox(height: 10.0),
                  Text('Date and time:',
                      style:
                          TextStyle(fontSize: 14.0, color: Colors.grey[600])),
                  Text('Today, 7:30 PM',
                      style:
                          TextStyle(fontSize: 16.0, color: Colors.grey[800])),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    onPressed: () {
                      showInSnackBar('Appointment booked successfully.');
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pushNamed(context, '/user_dashboard');
                      });
                    },
                    child: const Text(
                      'Book Slot',
                      style: TextStyle(fontSize: 16),
                    ),
                    color: Colors.blue[500],
                    textColor: Colors.white,
                  ),
                ],
              ),
            )
        )
    );
  }
}
