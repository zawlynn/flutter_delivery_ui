import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  int rating;

  Ratings(this.rating);

  @override
  Widget build(BuildContext context) {
    String star = "";
    for (int i = 0; i < rating; i++) {
      star += "😍";
    }
    return Text(
      star,
      style: TextStyle(
        fontSize: 20,
        letterSpacing: 1,
      ),
    );
  }
}
