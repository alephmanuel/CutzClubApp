import 'package:flutter/material.dart';
import 'package:flutter_demo/Pages/Appointment.dart';
import 'package:flutter_demo/Pages/ChatRoom.dart';
import 'package:flutter_demo/Pages/Shop.dart';
import 'package:flutter_demo/Pages/Home.dart';
//import 'package:sqflite/sqflite.dart';
import 'ExampleClass.dart';

void main() 
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  /* List<Students> students = [];
  dynamic database; */

  // async: used to have access to the use of keyword 'await'.

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      title: 'Barber Shop',
      home: MyBottomNavBar(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber
      ),
      
    );
  }
}


// NAVIGATION VIEW

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> 
{
  int navBar_index = 0;
  final List<Widget> screens = [
    HomePage(),
    AppointmentPage(),
    ShopPage(),
    ChatRoom()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.grey[900],
      // Highlighted middle button in the navigation bar
      floatingActionButton: FloatingActionButton
      (
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
        onPressed:() {
          onTabTapped(1);
        },
      ),
      // Set floating action button over the navigation bar in the middle
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // Left drawer: Menu
      drawer: Drawer(),
      
      // APP BAR: Bar at the top of the app
      appBar: AppBar
      (
        backgroundColor: Colors.transparent,
        elevation: 0,
        
        // Build a drawer with its properties
        leading: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Builder(
            builder:(context) => IconButton(
              onPressed:() => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu),
              color: Colors.amber
            ),
          ),
        ),
        
        // Buttons after the app bar title
        actions: [
          // Add space around the icon
          Padding(
            padding: EdgeInsets.only(right: 15.0), // Add space only on right side of icon
            child: Builder( // Build and icon that opens endDrawer
              builder:(context) => IconButton(
                onPressed:() => Scaffold.of(context).openEndDrawer(),
                icon: Icon(Icons.notifications),
                color: Colors.amber
              )
            )
          )
        ],
      ),
      // Right drawer: Notifications
      endDrawer: Drawer(),

      // BODY: Display selected index screen
      body: screens[navBar_index],
      
      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar
      (
        fixedColor: Colors.amber,
        
        // currentIndex is the selector of the element in 'items' array
        currentIndex: navBar_index,
        items: 
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Appointment'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), 
            label: 'Shop'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message), 
            label: 'Chat'
          )
        ],
        
        // Calls function that updates the selected index screen
        onTap: onTabTapped,
      ),
    );
  }
  
  // Updates index to selected screen from navigation bar
  void onTabTapped(int index)
  {
    setState(() {
      navBar_index = index;
    });
  }
}
