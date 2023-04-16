import 'package:flutter/material.dart';

import '../constants.dart';

class iconText extends StatelessWidget {
  iconText({required this.icon, required this.teName});
  final IconData icon;
  final String teName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 20),
        Text(
          teName,
          style: labelText,
        )
      ],
    );
  }
}
