import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      body: Column
      (
        children: [
          // Welcome text
          Padding(
            padding: EdgeInsets.only(right: 80.0),
            child: Text(
              "Good Morning, User!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),

          // Make a gap between welcome text and search bar
          SizedBox(height: 30.0),

          // Search bar
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
          Expanded(
            child: ListView
            (
              
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 3.0, top: 30.0, bottom: 40.0, left: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey
                    ),
                    width: 200.0,
                    height:100.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0, top: 30.0, bottom: 40.0, left: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey
                    ),
                    width: 200.0,
                    height: 100.0,
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