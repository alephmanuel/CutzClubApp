import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// checkEmail() async {
//   // Get the currently authenticated user from Firebase Authentication
//   final User? user = FirebaseAuth.instance.currentUser;

//   // Get the user's email address from their Firebase Authentication profile
//   final String? email = user?.email;

//   // Query Firestore for a document with the same email address
//   final CollectionReference usersRef =
//       FirebaseFirestore.instance.collection('user');
//   final QuerySnapshot querySnapshot =
//       await usersRef.where('email', isEqualTo: email).get();

//   if (querySnapshot.docs.isNotEmpty) {
//     // A matching document was found
//     final DocumentSnapshot userDoc = querySnapshot.docs.first;
//     print(userDoc.data());
//   } else {
//     // No matching document was found
//     print('No user found with email: $email');
//   }
//   final DocumentSnapshot userDoc = querySnapshot.docs.first;

//   return userDoc;
// }
