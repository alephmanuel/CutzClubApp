import 'dart:ffi';

import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  final String haircut_image;
  final double price;
  final String haircutname;

  ServiceTile({required this.haircut_image, required this.haircutname, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)),
        width: 120,
        child: Column(
          children: [
            /* ⁡⁢⁣⁣Image widget⁡ with its properties. */
            Image
            (
              image: AssetImage(
                haircut_image,
              ),
              width: 80,
              height: 100,
            ),
            Padding
            (
              padding: EdgeInsets.only(top: 5),
              /* Row that has the ⁡⁢⁣⁣haircut name⁡ and the ⁡⁢⁣⁣price⁡ of it ⁡⁢⁣⁣with its icon⁡. */
              child: Row
              (
                children: [
                  Text(haircutname),
                  /* ⁡⁢⁣⁣Space between⁡ the haircut name and the price */
                  SizedBox(width: 3),
                  TextButton.icon
                  (
                    onPressed:() {
                      null;
                    },
                    icon: Icon(Icons.add_box_rounded),
                    label: Text("$price")
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
