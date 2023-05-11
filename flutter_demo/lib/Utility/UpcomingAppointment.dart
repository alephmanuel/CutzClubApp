import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String barber_name;
  String date;
  final String hour;
  AppointmentCard({
    required this.barber_name,
    required this.date,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.black),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),

              /* User icon and name inside with ⁡⁢⁣⁣upcoming appointment information⁡. */
              child: Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.amber,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(barber_name),
                      Text(
                        "Barber",
                        style: TextStyle(color: Colors.grey[500], fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(width: 70),
                  TextButton(
                    onPressed: () {},
                    child: Text("View details"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Icon(Icons.calendar_today),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(date)),
                    SizedBox(width: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Icon(Icons.access_time),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(hour)),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[800]),
                height: 50,
              ),
            ),
          ],
        ),
        height: 150,
      ),
    );
  }
}