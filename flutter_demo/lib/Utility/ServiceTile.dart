import 'dart:ffi';

import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  final String haircut_image;
  final int price;
  final String haircut_name;
  final String haircut_description;

  ServiceTile(
      {required this.haircut_image,
      required this.haircut_name,
      required this.price,
      required this.haircut_description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Container(
        child: Card(
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* ⁡⁢⁣⁣Image | Haircut name | ⁡⁢⁣⁣price⁡. */
              Row(
                children: [
                  ClipRRect(
                    child: Image.asset(haircut_image,
                        width: 80, height: 100, fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(haircut_name), // ⁡⁢⁣⁣Haircut name⁡
                        SizedBox(height: 5),
                        Text( // ⁡⁢⁣⁣Haircut price⁡
                          "\$" + price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.amber),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              /* ⁡⁢⁣⁣Haircut description⁡ */
              Padding(
                padding: const EdgeInsets.all(7),
                child: Text(
                  haircut_description,
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
        width: 200, /* ⁡⁢⁣⁣Width of container⁡ */
      ),
    );
  }
}
