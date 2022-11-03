import 'package:flutter/material.dart';

class ProfileLableCount extends StatelessWidget {
  final String count;
  final String title;
  const ProfileLableCount({Key? key, required this.count, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}
