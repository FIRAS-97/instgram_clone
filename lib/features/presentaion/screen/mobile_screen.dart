import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:instgram_clone/features/presentaion/screen/add_post_screen.dart';
import 'package:instgram_clone/features/presentaion/screen/home_screen.dart';
import 'package:instgram_clone/features/presentaion/screen/notification_screen.dart';
import 'package:instgram_clone/features/presentaion/screen/person_screen.dart';
import 'package:instgram_clone/features/presentaion/screen/search_screen.dart';

class MobileScreen extends StatefulWidget {
  MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _selectedIndex = 0;
  List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    AddPostsScreen(),
    NotificationScreen(),
    PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: GNav(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            color: Colors.grey[200],
            tabBackgroundColor: Colors.grey.withOpacity(0.1),
            activeColor: Colors.white,
            tabs: [
              GButton(
                icon: Icons.home,
              ),
              GButton(
                icon: Icons.search_sharp,
              ),
              GButton(
                icon: Icons.add_box_rounded,
              ),
              GButton(
                icon: Icons.favorite_outline_rounded,
              ),
              GButton(
                icon: Icons.person,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }));
  }
}
