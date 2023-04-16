import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: largeText,
          ),
        ),
        //color: Colors.redAccent,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)
            //more than 50% of width makes circle
            ),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
