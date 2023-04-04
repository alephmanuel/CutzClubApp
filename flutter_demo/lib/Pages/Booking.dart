import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

/* Booking: Book your appointment by selecting the date and time of the appointment.
            During the process, you have to option to book your appointment by
            the type of service or the barber of choice */

class BookingAppointment extends StatefulWidget {
  const BookingAppointment({super.key});

  @override
  State<BookingAppointment> createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.grey[900],
      body: Column
      (
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: IconButton
            (
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              onPressed:() {
                Navigator.pop(context);
              },
            ),
          )
        ]
      )
    );
  }
}