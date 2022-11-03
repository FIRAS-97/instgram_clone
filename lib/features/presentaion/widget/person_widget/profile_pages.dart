import 'package:flutter/material.dart';
import 'add_image.dart';
import 'profile_count_lable.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 12, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              addImageWidget(),
              SizedBox(
                width: 8,
              ),
              ProfileLableCount(
                count: "0",
                title: "Posts",
              ),
              ProfileLableCount(
                count: "140",
                title: "Followers",
              ),
              ProfileLableCount(
                count: "140",
                title: "Following",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Name",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "omputer and automation",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade400)),
                ),
              ),
            ],
          ),
        ),
        ExpansionTile(
          onExpansionChanged: (value) => {
            setState(() {
              isOpen = value;
            }),
          },
          title: Text("Story Highlights"),
          subtitle: isOpen
              ? Text("Keep Your Favorite Stories on your Profile")
              : null,
          children: [
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return index != 0
                      ? Container(
                          width: 80,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 30,
                          ),
                        )
                      : Container(
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Icon(Icons.add)),
                              Text("New"),
                            ],
                          ),
                        );
                }),
              ),
            ),
          ],
        ),
        Divider(
          indent: 10,
          endIndent: 10,
          height: 1,
          color: isOpen ? Colors.transparent : Colors.grey,
        ),
      ],
    );
  }
}
