import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo/Pages/Home.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_demo/Utility/Barbers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo/Utility/BarberCard.dart';
import 'package:flutter_demo/Utility/ServiceTile.dart';

/* Booking: Book your appointment by selecting the date and time of the appointment.
            During the process, you have to option to book your appointment by
            the type of service or the barber of choice */

class BookingAppointment extends StatefulWidget {
  const BookingAppointment({super.key});

  @override
  State<BookingAppointment> createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  //Access barbers database
  final Stream<QuerySnapshot> barbers =
      FirebaseFirestore.instance.collection('barber').snapshots();

  //Access services database
  final Stream<QuerySnapshot> services =
      FirebaseFirestore.instance.collection('service').snapshots();

  CollectionReference appointment =
      FirebaseFirestore.instance.collection('appointment');

  DateTime date_selected = DateTime.now();
  CalendarFormat format = CalendarFormat.month;
  var barber_selected = "";
  var service_selected = "";
  var hour_selected = "";
  // String minutes_selected = "";

  int index_barber_hours = 0;

  /* Boolean variable to determine if a 'button' container is tapped. */
  bool isEnabled = false;

  /* ⁡⁢⁣⁣List of barbers⁡ where the user will select one for the appointment. */
  final barberList = ['Gustavo Rassi', 'Aleph Gonzalez', 'John Smith'];

  /* Function to update the day for every time there's an input by the user. */
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      date_selected = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    int hour = date_selected.hour;
    int minutes = date_selected.minute;
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(
            'Book your appointment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.amber,
              fontSize: 20.0,
              //decoration: TextDecoration.underline,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          child: Column(children: [
            // Row(children: [
            //   Padding(
            //     padding: const EdgeInsets.only(top: 60.0),
            //     child: IconButton(
            //       icon: Icon(Icons.arrow_back),
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //     ),
            //   ),
            //   /* Title of the page: Book your appointment. */
            //   Container(
            //     padding: EdgeInsets.fromLTRB(12, 55, 50, 4),
            //     child: Text(
            //       'Book your appointment',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         letterSpacing: 1.2,
            //         color: Colors.amber,
            //         fontSize: 20.0,
            //         //decoration: TextDecoration.underline,
            //       ),
            //     ),
            //   ),
            // ]),

            // DIVIDER--------------------
            /* Divider between the title and the calendar. */
            // Divider(
            //   color: Colors.white,
            //   thickness: 2.5,
            // ),
            // END OF DIVIDER-------------

            //Section to pick the date for the appointment
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Select the date for the appointment:',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  /* Table calendar and its properties. */
                  child: TableCalendar(
                    locale: "en_US", // Timezone
                    rowHeight:
                        50, // Basically, the space in between the row of the days.
                    daysOfWeekHeight: 45, // Space between
                    headerStyle: const HeaderStyle(
                      titleCentered:
                          true, // Alignment of the month to the center.
                      formatButtonVisible:
                          true, // Display the button to toggle view: biweekly, monthly, weekly.
                      formatButtonShowsNext: true, // Shows next viewing option.
                    ),

                    /* Viewing formats (by month, weekly or biweekly) */
                    availableGestures: AvailableGestures.all,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                      CalendarFormat.twoWeeks: '2 weeks',
                      CalendarFormat.week: 'Week',
                    },
                    focusedDay: DateTime.now(),
                    selectedDayPredicate: (day) =>
                        isSameDay(day, date_selected),

                    /* Sets the range of the dates in the calendar. */
                    firstDay: DateTime.utc(2022, 1, 1),
                    lastDay: DateTime.utc(2052, 12, 31),
                    //==================
                    onDaySelected: _onDaySelected,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    daysOfWeekVisible: true,
                    calendarFormat: format,
                    onFormatChanged: (format) {
                      setState(() {
                        this.format = format;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: true,
                      selectedDecoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                          border: Border.all(
                              style: BorderStyle.solid,
                              width: 2,
                              color: Colors.black54)),
                      todayDecoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        shape: BoxShape.circle,
                        border: Border.all(
                            style: BorderStyle.solid,
                            width: 1.5,
                            color: Colors.white24),
                      ),
                      selectedTextStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.transparent))),
            ),

            //////////////
            /* Vertical list of the available hours. */
            /* Container(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          hour = index + 8;
                          minutes = 0;
                          hour_selected = hour.toString().padLeft(2, '0');
                          minutes_selected = minutes.toString().padLeft(2, '0');
                        }),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        child: Text(
                          "${index + 8}:00 AM",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            //fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ), */
            //
            /* DIVIDER: Between the  */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 2.5,
              ),
            ),

            // section to pick the barber for the appointment
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Select the barber for the appointment:',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                height: 190,
                child: StreamBuilder<QuerySnapshot>(
                    stream: barbers,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something Went Wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final data = snapshot.requireData;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEnabled = !isEnabled;
                                  barber_selected =
                                      '${data.docs[index]['first_name']} ${data.docs[index]['last_name']}';
                                  index_barber_hours = index;
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.black,
                                  )),
                                  child: BarberCard(
                                      barber_name:
                                          '${data.docs[index]['first_name']} ${data.docs[index]['last_name']}',
                                      barber_image:
                                          'lib/Images/${data.docs[index]['image']}')));
                        },
                      );
                    }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 2.5,
              ),
            ),

            //Section to pick the desired hour for the appointment
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Select the hour for the appointment:',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                height: 100,
                child: StreamBuilder<QuerySnapshot>(
                    stream: barbers,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something Went Wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final data = snapshot.requireData;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data
                            .docs[index_barber_hours]['availability_hours']
                            .length,
                        itemBuilder: (context, index) {
                          final hours_available =
                              data.docs[index]['availability_hours'].length;

                          return Center(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                              )),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    hour_selected =
                                        data.docs[index_barber_hours]
                                            ['availability_hours'][index];
                                  });
                                },
                                child: Text(
                                    '${data.docs[index_barber_hours]['availability_hours'][index]}'),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 2.5,
              ),
            ),

            //Section to select the desired service for the appointment
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Select the Service you desire:',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                height: 200,
                child: StreamBuilder<QuerySnapshot>(
                    stream: services,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something Went Wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final data = snapshot.requireData;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEnabled = !isEnabled;
                                  service_selected =
                                      data.docs[index]['service_name'];
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.black,
                                  )),
                                  child: ServiceTile(
                                      haircut_image:
                                          'lib/Images/${data.docs[index]['image']}',
                                      haircut_name: data.docs[index]
                                          ['service_name'],
                                      price: data.docs[index]['price'],
                                      haircut_description: data.docs[index]
                                          ['description'])));
                        },
                      );
                    }),
              ),
            ),

            //Confirm Appointment
            Container(
              padding: EdgeInsets.only(top: 28, bottom: 30),
              child: ElevatedButton.icon(
                onPressed: () {
                  confirm_appointment(context);
                },
                icon: const Icon(Icons.check),
                label: const Text('Confirm Appointment'),
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(200, 20))),
              ),
            ),
          ]),
        ));
  }

  //Widget for the Confirm Button
  void confirm_appointment(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              scrollable: true,
              title: Text('Confirm Appointment'),
              content: Column(
                children: [
                  //Shows selected DATE
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Date Selected:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      '${date_selected.month}/${date_selected.day}/${date_selected.year}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  //Shows selected BARBER
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Barber Selected:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      barber_selected,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  //Shows selected HOUR
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Hour Selected:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      hour_selected,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  //Shows selected SERVICE
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Service Selected:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      service_selected,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18),
                    )),
                TextButton(
                    onPressed: () {
                      appointment
                          .add({
                            'barber': barber_selected,
                            'date': date_selected,
                            'hour': hour_selected,
                            'service': service_selected
                          })
                          .then((value) => print('Appointment Added'))
                          .catchError((error) =>
                              print('Failed to add appointment: $error'));

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ));
  }
}
