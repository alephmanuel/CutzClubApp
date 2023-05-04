/* Database imports: Firebase */

/* Essential imports: Material app and framework */
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

/* Pages folder */
import 'package:flutter_demo/Pages/Appointment.dart';
import 'package:flutter_demo/Pages/UserProfile.dart';
import 'package:flutter_demo/Pages/Booking.dart';
import 'package:flutter_demo/Utility/BarberCard.dart';

/* Utility file */
import 'package:flutter_demo/Utility/Barbers.dart';
import 'package:flutter_demo/Utility/ServiceTile.dart';

/* Package dependency */
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/* ============================================== */
/* ⁡⁢⁣⁣HOME PAGE⁡ */
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      // Side panel for notifications section
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Notifications"),
              onTap: () {
                null;
              },
            ),
            ListTile(
              title: Text("Messages"),
              onTap: () {
                null;
              },
            ),
            ListTile(
              title: Text("Alerts"),
              onTap: () {
                null;
              },
            )
          ],
        ),
      ),

      /* FLOATING ACTION BUTTON (extended) */
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        label: Text("Book Appointment"),
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingAppointment(),
            ),
          );
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Row(
              children: [
                // INDEX 1
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    /* Row of elements, where the 1st one is the
                    avatar and the 2nd one is a column with 2 text
                    widgets. */
                    child: Row(
                      children: [
                        /* ⁡⁣⁢⁡⁢⁣⁣User account widget.⁡⁡ */
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('lib/Images/IMG_2360.png'),
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Colors.transparent,
                            ),
                            /* ⁡⁢⁣⁣User icon⁡ */
                            /* Tapping on the user icon will take you to the
                            profile page */
                            onPressed: () {
                              Navigator.push(
                                /* Get a context where it pushes a new page to the stack */
                                context,
                                // Take me to the profile page
                                MaterialPageRoute(
                                  builder: (context) => UserProfile(),
                                ),
                              );
                            },
                          ),
                        ),
                        /* ⁡⁣⁢⁡⁣⁢⁡⁢⁣⁣Welcome message and user name⁡⁡ display one on top of the other. */
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome to CutzClub!",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Gustavo Rassi",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Space in between the elements
                SizedBox(width: 120),

                // INDEX 2
                /* Right side panel/drawer⁡: ⁡⁢⁣⁣Notifications⁡ */
                Container(
                  child: Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(Icons.notifications,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /* ⁡⁢⁣⁣Gap between⁡ welcome text and search bar. */
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, top: 20),
            child: Container(
              child: Text(
                "Book your next appointment.💈",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
          ),

          // ⁡⁢⁣⁣SEARCH BAR⁡ with text field
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons
                    .search), // Add icon inside search bar and behind text field
                hintText: 'Search barbers, hairstyles...',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: Colors.white),
          ),

          // Fill in the space left with more content.
          /* ⁡⁢⁣⁣List of the sections⁡ below. */
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                /* First section/index: ⁡⁢⁣⁣UPCOMING APPOINTMENT⁡ */
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Container(
                    child: Text(
                      "Upcoming Appointment",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black),
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
                                  Text("John Smith"),
                                  Text(
                                    "Barber",
                                    style: TextStyle(
                                        color: Colors.grey[500], fontSize: 13),
                                  ),
                                ],
                              ),
                              SizedBox(width: 110),
                              TextButton(
                                onPressed:() {
                                  
                                },
                                child: Text("View details"),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 15),
                          child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Icon(Icons.calendar_today),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text("MM/DD")),
                                SizedBox(width: 50),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Icon(Icons.access_time),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text("HH/MM")),
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
                ),
                /* ⁡⁢⁣⁣Upcoming Appointment Information widget ends here.⁡ */
                // End of index 1
                /* ================================================= */
                // Begin of index 2: ⁡⁢⁣⁣TRENDING HAIRSTYLES⁡⁡
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10.0, top: 40.0, right: 10),
                  child: Row(
                    children: [
                      Text(
                        "Trending Hairstyles",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 135),
                      TextButton(
                        onPressed: () {},
                        child: Text("See All"),
                      ),
                    ],
                  ),
                ),
                /* ⁡⁢⁣⁣List of ⁡⁢⁣⁣hairstyles⁡ provided by the barbershop. */
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    height: 210,
                    /* ⁡⁢⁣⁣ServiceTile()⁡ is a reusable function that has the structure of the widget
                    that displays the hairstyles with their prices and names. This implementation
                    helps the developer understand the code, making it easier to read. */
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ServiceTile(
                          haircut_image: 'lib/Images/6-mens-taper-cut.png',
                          haircut_name: "Crew Cut",
                          price: 23,
                          haircut_description: "Hair is slightly longer on top and shorter on the sides.",
                        ),
                        ServiceTile(
                            haircut_image: 'lib/Images/Undercut.png',
                            haircut_name: "Undercut",
                            price: 25,
                            haircut_description: "Hair on the sides and back is trimmed very short. Hair on top longer and styled.",
                        ),
                        ServiceTile(
                            haircut_image: 'lib/Images/FrenchCrop.png',
                            haircut_name: "French Crop",
                            price: 20,
                            haircut_description: "Modern version of the crew cut. Hair on top is cut in a slightly longer and textured style.",
                        ),
                        ServiceTile(
                            haircut_image: 'lib/Images/Pompadour.png',
                            haircut_name: "Pompadour Cut",
                            price: 25,
                            haircut_description: "Retro hairstyle. Top hair swept upwards and back. Sides and back trimmed shorter.",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10.0, top: 40.0),
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "Top Barbers",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 200),
                        TextButton(
                          onPressed: () {},
                          child: Text("See All"),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent),
                    height: 190,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // ⁡⁢⁣⁣List of barbers.⁡
                        BarberCard(
                          barber_name: "John Smith",
                          barber_image: 'lib/Images/JohnSmith.png',
                        ),
                        BarberCard(
                          barber_name: "Gustavo Rassi",
                          barber_image: 'lib/Images/IMG_2360.png',
                        ),
                        BarberCard(
                          barber_name: "Aleph Gonzalez",
                          barber_image: 'lib/Images/AlephGonzalez.png',
                        )
                      ],
                    ),
                  ),
                ),
                // End of index 2
                /* ========================================== */
                // Begin of index 3: SERVICES/HAIRSTYLES
              ],
            ),
          ),
        ],
      ),
    );
  }
}
