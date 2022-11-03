import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilis/color_const/colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final String assetName = 'assets/ic_instagram.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  assetName,
                  height: 30,
                  color: primaryColor,
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.messenger_rounded)),
              ],
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       height: 220,
            //       width: MediaQuery.of(context).size.width * 0.45,
            //       child: Column(children: [
            //         Stack(
            //           children: [
            //             CircleAvatar(
            //               backgroundColor: Colors.grey.shade600,
            //               radius: 60,
            //               backgroundImage: NetworkImage(""),
            //             ),
            //           ],
            //         )
            //       ]),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
