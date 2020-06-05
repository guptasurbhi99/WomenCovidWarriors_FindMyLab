import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  const HospitalCard({
    Key key,
    @required this.hospital,
    this.bookAppointment
  }) : super(key: key);

  final hospital;
  final Function bookAppointment;

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
                SizedBox(height: 4.0),
                Text(
                    hospital.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      color: Colors.grey[900],
                    )
                ),
                SizedBox(height: 2.0),
                Text(
                    hospital.address,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[500],
                    )
                ),
                SizedBox(height: 4.0),
                Row(
                  children: <Widget>[
                    Text(
                        'Available slots:',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[800]
                        )
                    ),
                    SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.blue[200],
                      child: Text(
                          hospital.slots[0],
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white
                          )
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.blue[200],
                      child: Text(
                          hospital.slots[1],
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Center(
                  child: FlatButton(
                  onPressed: bookAppointment,
                  child: const Text(
                    'Book Slot',
                    style: TextStyle(fontSize: 16),
                    ),
                      textColor: Colors.blue[400],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
