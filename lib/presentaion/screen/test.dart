// import 'dart:html';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:image_picker/image_picker.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({Key? key}) : super(key: key);

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   var storageImage = FirebaseStorage.instance.ref().child("dddadsasdad");
//   var task = storageImage.putFile(r);
//   File? image;
//   String? url;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.ac_unit_sharp),
//           ),
//         ),
//         body: Center(
//           child: Stack(
//             children: [
//               const CircleAvatar(
//                 backgroundImage: NetworkImage(
//                     "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"),
//                 radius: 60,
//               ),
//               Positioned(
//                 bottom: -10,
//                 left: 80,
//                 child: IconButton(
//                   icon: Icon(Icons.add_a_photo),
//                   onPressed: () async {
//                     ;
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }

//   Future getImage() async {
//     var img = await ImagePicker().pickImage(source: ImageSource.gallery);
//   var r= await img!.readAsBytes();
//     setState(() {
//       image = img;
//     });
//   }
// }
