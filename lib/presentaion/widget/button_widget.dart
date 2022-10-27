import 'package:flutter/material.dart';

import '../../utilis/color_const/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
      ),
      decoration: ShapeDecoration(
          color: blueColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      padding: EdgeInsets.symmetric(vertical: 12),
    );
  }
}
