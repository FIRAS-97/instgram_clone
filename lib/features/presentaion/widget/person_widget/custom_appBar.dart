import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Firas_zn"),
          Icon(Icons.keyboard_arrow_down_outlined),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ],
    );
  }
}
