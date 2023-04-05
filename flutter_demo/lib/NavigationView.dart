import 'package:flutter/material.dart';
import 'package:flutter_demo/Pages/Appointment.dart';
import 'package:flutter_demo/Pages/ChatRoom.dart';
import 'package:flutter_demo/Pages/Shop.dart';
import 'package:flutter_demo/Pages/Home.dart';
//import 'package:sqflite/sqflite.dart';

// NAVIGATION VIEW

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int navBar_index = 0;
  final List<Widget> screens = [
    HomePage(),
    AppointmentPage(),
    ShopPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // Highlighted middle button in the navigation bar
      /* floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
        onPressed: () {
          onTabTapped(1);
        },
      ),
      // Set floating action button over the navigation bar in the middle
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, */

      // BODY: Display selected index screen
      body: screens[navBar_index],

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.amber,

        // currentIndex is the selector of the element in 'items' array
        // Elements of the navigation bar.
        currentIndex: navBar_index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Appointments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Shop'),
        ],

        // Calls function that updates the selected index screen
        onTap: onTabTapped,
      ),
    );
  }

  // Updates index to selected screen from navigation bar
  void onTabTapped(int index) {
    setState(() {
      navBar_index = index;
    });
  }
}
