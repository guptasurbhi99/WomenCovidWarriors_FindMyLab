import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key key,
    @required this.appointment,
  }) : super(key: key);

  final appointment;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  appointment.patientName,
                  style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                  color: Colors.grey[900],
                  )
                ),
                SizedBox(height: 6.0),
                Text(
                    appointment.patientSlot,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blue[500]
                    )
                ),
              SizedBox(height: 6.0),
            ],
          ),
        ),
      ),
    );
  }
}
