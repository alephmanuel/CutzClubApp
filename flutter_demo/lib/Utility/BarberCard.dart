import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BarberCard extends StatelessWidget {
  final String barber_name;
  final String barber_image;
  BarberCard({required this.barber_name, required this.barber_image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Container(
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* Barber ⁡⁢⁣⁣profile image⁡. */
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CircleAvatar(
                backgroundImage: AssetImage(barber_image),
                backgroundColor: Colors.amber,
                radius: 30
              ),
            ),
            /* ⁡⁢⁣⁣Barber's name⁡ and border */
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                  child: Text(
                    barber_name,
                    style: TextStyle(fontSize: 14)
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(30)
                ),
              )
            ),
            /* ⁡⁢⁣⁣RATING BAR⁡ of the barber. */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RatingBar.builder(
                itemSize: 18,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                   color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            //////////////////////////////////////
            /* ⁡⁢⁣⁣View Profile⁡ ⁡⁢⁣⁣button.⁡ */
            Padding
            (
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                child: GestureDetector(
                  child: Padding
                  (
                    padding: EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
                    child: Text("View Profile",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  onTap: () {
                    null;
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
        /* Barber's card ⁡⁢⁣⁣properties⁡. */
        decoration: BoxDecoration(
          color: Colors.black, 
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}