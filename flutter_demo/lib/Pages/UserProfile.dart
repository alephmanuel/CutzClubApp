import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 112),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          //
          SizedBox(height: 35),
          //
          //===================
          // USER ICON
          CircleAvatar(
            backgroundImage: AssetImage('lib/Images/IMG_2360.png'),
            backgroundColor: Colors.amber,
            radius: 60,
          ),
          //
          //====================
          // PROFILE ITEMS
          Container(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 70),
                      Text(
                        "Gustavo Rassi",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                //==================
                // DIVIDER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                // DIVIDER
                //==================
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Icon(Icons.phone_android_rounded),
                      SizedBox(width: 70),
                      Text(
                        "787-218-4328",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                //==================
                // DIVIDER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                // DIVIDER
                //==================
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Icon(Icons.mail_outline_rounded),
                      SizedBox(width: 70),
                      Text(
                        "gustavo.rassi@upr.edu",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                //==================
                // DIVIDER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                // DIVIDER
                //==================
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Icon(Icons.remove_red_eye_outlined),
                      SizedBox(width: 70),
                      Text(
                        "••••••••••••",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                //==================
                // DIVIDER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                // DIVIDER
                //==================
                //
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Icon(Icons.person_4_outlined),
                      SizedBox(width: 70),
                      Text(
                        "Preferred Barber Name",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                //==================
                // DIVIDER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                // DIVIDER
                //==================
                //

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    child: Text("Edit Profile"),
                  ),
                ),
              ],
            ),
            //=================
            // CONTAINER PROPERTIES
            height: 400,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            //=================
          ),
        ],
      ),
    );
  }
}
