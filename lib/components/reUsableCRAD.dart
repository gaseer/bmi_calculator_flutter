import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 4.5, bottom: 4.5),
        child: cardChild,
        margin: EdgeInsets.all(17.0),
        decoration: BoxDecoration(
          color: colour,
          boxShadow: const [
            BoxShadow(
              blurRadius: 30.0,
              offset: Offset(28, 28),
              color: Colors.grey,
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
