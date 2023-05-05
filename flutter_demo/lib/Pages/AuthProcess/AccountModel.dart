import 'package:flutter/material.dart';

class AccountModel {
  final int? ID; 
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final int phone_number;

  const AccountModel({
    this.ID,
    required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
    required this.phone_number,
  });

  toJson(){
    return{
      "First Name" : first_name,
      "Last Name" : last_name,
      "Email" : email,
      "Password" : password,
      "Phone" : phone_number
    };
  }
  
}