import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_demo/Utility/Barbers.dart';

/* Booking: Book your appointment by selecting the date and time of the appointment.
            During the process, you have to option to book your appointment by
            the type of service or the barber of choice */

class BookingAppointment extends StatefulWidget {
  const BookingAppointment({super.key});

  @override
  State<BookingAppointment> createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  DateTime date_selected = DateTime.now();
  CalendarFormat format = CalendarFormat.month;
  String barber_selected = "";
  String hour_selected = "";
  String minutes_selected = "";

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
        body: SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              /* Title of the page: Book your appointment. */
              Container(
                padding: EdgeInsets.fromLTRB(12, 55, 50, 4),
                child: Text(
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
            ]),

            // DIVIDER--------------------
            /* Divider between the title and the calendar. */
            Divider(
              color: Colors.amber,
              thickness: 2.5,
            ),
            // END OF DIVIDER-------------
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
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
                  selectedDayPredicate: (day) => isSameDay(day, date_selected),

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
              ),
            ),
            SizedBox(height: 15),
            Divider(
              color: Colors.amber,
              thickness: 2.5,
            ),
            SizedBox(height: 15),
            Container(
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
            ),
            SizedBox(height: 9),
            Divider(
              color: Colors.amber,
              thickness: 2.5,
            ),
            SizedBox(height: 10),
            Container(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    child: Row(
                      children: 
                      [
                        Barber(name: "John Smith"),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: VerticalDivider(color: Colors.white),
                        ),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(child:Text("HELLOOOO"))
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(
                      () {
                        barber_selected = "John Smtih";
                      },
                    ),
                    child: Barber(name: "John Smith"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(
                      () {
                        barber_selected = "Aleph Gonzalez";
                      },
                    ),
                    child: Barber(name: "Aleph Gonzalez"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade900,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(
                      () {
                        barber_selected = "Gustavo Rassi";
                      },
                    ),
                    child: Barber(name: "Gustavo Rassi"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 45.0),
              child: Text(
                'Day of the appointment: ${date_selected.day}/${date_selected.month}/${date_selected.year}',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Time Picked for the appointment: $hour_selected:$minutes_selected',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Barber Selected: $barber_selected",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 28, bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Submit Appointment'),
              ),
            ),
          ]),
        ));
  }
}
