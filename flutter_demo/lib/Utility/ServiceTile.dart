import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  final AssetImage haircut_image;

  ServiceTile({required this.haircut_image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 100,
        child: Column(
          children: [
            Image.asset(
              haircut_image as String,
              width: 70,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
