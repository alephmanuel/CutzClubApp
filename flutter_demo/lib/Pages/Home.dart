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

                        ),
                        SizedBox(width: 15.0,),
                        Container
                        (

                        )
                      ]
                    )
                  ),
                ),

                // Space in between the elements
                SizedBox(width: 120.0),

                // INDEX 2
                Padding
                (
                  padding: EdgeInsets.only(right: 15.0),
                  child: Container
                  (
                    padding: EdgeInsets.only(right: 30.0),
                    
                    decoration: BoxDecoration
                    (
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30.0)
                    )
                  )
                ),
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