import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo/Pages/Appointment.dart';
import 'package:flutter_demo/Pages/UserProfile.dart';
import 'package:flutter_demo/Pages/Booking.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
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
        )
      ),
      
      // FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton
      (
        backgroundColor: Colors.amber,
        child: Icon(Icons.add_card),
        onPressed: () {
          Navigator.push
          (
            context,
            MaterialPageRoute(
              builder:(context) => BookingAppointment(),
            )
          );
        },
      ),

      body: Column
      (
        children: [
          Padding
          (
            padding: const EdgeInsets.only(top: 60.0),
            child: Row
            (
              children: [
                // INDEX 1
                Padding
                (
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container
                  (
                    /* Row of elements, where the ist one is the
                    avatar and the 2nd one is a column with 2 text
                    widgets. */
                    child: Row
                    (
                      children: [
                        CircleAvatar
                        (
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            icon: Icon(Icons.person),
                            
                            /* Tapping on the user icon will take you to the
                            profile page */
                            onPressed: (){
                              Navigator.push(
                                /* Get a context where it pushes a new page to the stack */
                                context,
                                // Take me to the profile page
                                MaterialPageRoute(
                                  builder:(context) => UserProfile(),
                                )
                              );
                            }
                          )
                        ),
                        SizedBox(width: 10.0),
                        Container
                        (
                          child: Text("Welcome back\n<user>")
                        )
                      ]
                    )
                  ),
                ),

                // Space in between the elements
                SizedBox(width: 160.0),

                // INDEX 2
                Container
                (
                  child: Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(Icons.chat_bubble_outline_rounded),
                    )
                  )
                )  
              ],
            )
          ),

          // Make a gap between welcome text and search bar
          SizedBox(height: 30.0),

          // Search bar with text field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), // Add icon inside search bar and behind text field
                hintText: 'Search barbers, services...',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),

          // Fill in the space left with more content
          /* Section tiles to navigate */
          Expanded(
            child: ListView
            (
              
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0, bottom: 10.0, left: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey
                    ),
                    width: 200.0,
                    height:150.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0, left: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey
                    ),
                    width: 200.0,
                    height: 150.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0, top: 10.0, left: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey
                    ),
                    width: 200.0,
                    height: 150.0,
                  ),
                )
              ]
            )
          )
        ]
      )
    );
  }
}