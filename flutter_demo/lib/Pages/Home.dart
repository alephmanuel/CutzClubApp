/* Database imports: Firebase */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
/* Essential imports: Material app and framework */
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

/* Pages folder */
import 'package:flutter_demo/Pages/Appointment.dart';
import 'package:flutter_demo/Pages/UserProfile.dart';
import 'package:flutter_demo/Pages/Booking.dart';
import 'package:flutter_demo/Utility/BarberCard.dart';
import 'package:flutter_demo/Pages/AuthProcess/getCurrentUser.dart';

/* Utility file */
import 'package:flutter_demo/Utility/Barbers.dart';
import 'package:flutter_demo/Utility/ServiceTile.dart';
import 'package:flutter_demo/auth.dart';

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
  String name = "";

  checkEmail() async {
    // Get the currently authenticated user from Firebase Authentication
    final User? user = FirebaseAuth.instance.currentUser;

    // Get the user's email address from their Firebase Authentication profile
    final String? email = user?.email;

    // Query Firestore for a document with the same email address
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection('user');
    final QuerySnapshot querySnapshot =
        await usersRef.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      // A matching document was found
      final DocumentSnapshot userDoc = querySnapshot.docs.first;

      // Extract field values and store them in variables
      final String? first_name = userDoc.get('first_name');
      final String? last_name = userDoc.get('last_name');

      name = '$first_name  $last_name';

      // Do something with the variables...
      print(name);
    } else {
      // No matching document was found
      print('No user found with email: $email');
    }
  }
  //Get current user information :3

  //Access all barbers
  final Stream<QuerySnapshot> barbers =
      FirebaseFirestore.instance.collection('barber').snapshots();

  //Access all services
  final Stream<QuerySnapshot> services =
      FirebaseFirestore.instance.collection('service').snapshots();

  @override
  Widget build(BuildContext context) {
    checkEmail();
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
            padding: const EdgeInsets.only(top: 20.0),
            child: SafeArea(
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
                                name,
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
                        icon: Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                                onPressed: () {},
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
                  padding: EdgeInsets.only(
                      left: 20, bottom: 10.0, top: 40.0, right: 10),
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
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                        height: 190,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: services,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something Went Wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              final data = snapshot.requireData;
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.size,
                                itemBuilder: (context, index) {
                                  return ServiceTile(
                                      haircut_image:
                                          'lib/Images/${data.docs[index]['image']}',
                                      haircut_name: data.docs[index]
                                          ['service_name'],
                                      price: data.docs[index]['price'],
                                      haircut_description: data.docs[index]
                                          ['description']);
                                },
                              );
                            }),
                      ),
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
                    decoration: BoxDecoration(color: Colors.transparent),
                    height: 190,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: barbers,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something Went Wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final data = snapshot.requireData;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.size,
                            itemBuilder: (context, index) {
                              return BarberCard(
                                  barber_name:
                                      '${data.docs[index]['first_name']} ${data.docs[index]['last_name']}',
                                  barber_image:
                                      'lib/Images/${data.docs[index]['image']}');
                            },
                          );
                        }),
                  ),
                ),
                // End of index 2
                /* ========================================== */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
