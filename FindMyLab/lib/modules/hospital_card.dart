import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  const HospitalCard({
    Key key,
    @required this.hospital,
  }) : super(key: key);

  final hospital;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                  hospital.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  )
              ),
              SizedBox(height: 6.0),
              Row(
                children: <Widget>[
                  Text(
                      hospital.slots[0],
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[800]
                      )
                  ),
                  SizedBox(width: 6.0),
                  Text(
                      hospital.slots[1],
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[800]
                      )
                  ),
                ],
              ),
              SizedBox(height: 6.0),
              Center(
                child: RaisedButton(
                onPressed: () {

                },
                child: const Text(
                  'Book Slot',
                  style: TextStyle(fontSize: 16)
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
