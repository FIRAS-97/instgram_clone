import 'package:flutter/material.dart';

class addImageWidget extends StatelessWidget {
  const addImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 45,
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              // color: Colors.blue,
              // border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
