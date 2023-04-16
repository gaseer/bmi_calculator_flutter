import 'package:flutter/material.dart';

import '../constants.dart';

class iconText extends StatelessWidget {
  iconText({required this.icon, required this.teName});
  final IconData icon;
  final String teName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          size: 90,
        ),
        SizedBox(width: 1),
        Text(
          teName,
          style: labelText,
        )
      ],
    );
  }
}
