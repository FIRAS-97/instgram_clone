import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:instgram_clone/utilis/color_const/colors.dart';
import '../../bloc/add_image/add_image_bloc.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/firestore_bloc/firestore_bloc.dart';
import '../../widget/button_widget.dart';
import '../../widget/circular_progress.dart';
import '../../widget/snack_bar.dart';
import '../../widget/textField.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailEditingController =
        TextEditingController();
    final TextEditingController passwordEditingController =
        TextEditingController();
    final TextEditingController userNameEditingController =
        TextEditingController();
    final TextEditingController PhoneNumberEditingController =
        TextEditingController();
    Uint8List? image;
    String? uid;
    bool isloading = false;

    final String assetName = 'assets/ic_instagram.svg';

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is loadingSignUpState) {
              isloading = true;

              print("ddddddddddddddddd");
            } else if (state is successSignUpState) {
              uid = BlocProvider.of<AuthBloc>(context).uid3;
              isloading = false;
              SnackBarWidget().snackBarSuccess(
                  message: state.succesMessage, context: context);

              print("success ssssssssssssss");
            } else if (state is ErrorSignUpState) {
              SnackBarWidget()
                  .snackBarErorr(message: state.errorMessage, context: context);
              ScaffoldMessenger(
                child: SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
        ),
        ///////////////////////////////////////////////////////// we can //
        BlocListener<FirestoreBloc, FirestoreState>(
          listener: (context, state) {
            if (state is LoadingAddDataToFirestoreState) {
            } else if (state is SuccessAddDataToFirestoreState) {
              print("add data to firestore ${state.successMessage}");
            } else if (state is ErorrAddDataToFirestoreState) {
              print("Don't add data to firestore ${state.errorMessage}");
            }
            if (state is loadingAddtoStorageCloudState) {
              print("loading add to Storage Cloude");
            } else if (state is SuccessAddtoStorageCloudState) {
              BlocProvider.of<FirestoreBloc>(
                context,
              ).add(
                AddDataToFirestoreEvent(
                  uid2: uid,
                  userName: userNameEditingController.text,
                  userEmail: emailEditingController.text,
                  phoneNumber: PhoneNumberEditingController.text,
                  // image:
                  //     BlocProvider.of<FirestoreBloc>(context).imageUrl,

                  // followers: follower,
                  // following: following,
                ),
              );
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((_) => LoginScreen())),
                  (route) => false);
              print("Add Data To Storage ");
            } else if (state is ErrorAddtoStorageCloudState) {
              print("Don't Add Data To Storage Cloude ");
            }
            // if (state is LoadingGetDataFromFirestoreState) {
            //   print("1111111111111");
            // } else if (state is SuccesGetDataFromFirestoreState) {
            //   print("22222222222222222222");
            // } else if (state is ErrorGetDataFromFirestoreState) {
            //   print("333333333333333333333333");
            // }
          },
        ),

        ///////////////////////////////////////////////////////////
      ],
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Flexible(
                  //   child: Container(),
                  //   flex: 2,
                  // ),
                  SvgPicture.asset(
                    assetName,
                    height: 60,
                    color: primaryColor,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<AddImageBloc, AddImageState>(
                    builder: (context, state) {
                      if (state is LoadingAddImageFromGallaryState) {
                      } else if (state is SuccssAddImageFromGallaryState) {
                        image = BlocProvider.of<AddImageBloc>(context)
                            .imageFromGalary;
                        print("qqqqqqqqqqqqqqqqqqqqqqqq");
                      } else if (state is ErorrAddImageFromGallaryState) {
                        print("sssssssssssssssss");
                      }

                      return Stack(
                        children: [
                          isloading
                              ? loadingProgress()
                              : image != null
                                  ? CircleAvatar(
                                      backgroundImage: MemoryImage(image!),
                                      radius: 60,
                                    )
                                  : const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"),
                                      radius: 60,
                                    ),
                          Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              icon: Icon(Icons.add_a_photo),
                              onPressed: () async {
                                BlocProvider.of<AddImageBloc>(context).add(
                                    AddImageFromGallaryEvent(
                                        imageSource: ImageSource.gallery));
                                ;
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    perf: Icon(Icons.person),
                    controller: userNameEditingController,
                    hint: 'Enter Your Name',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    perf: Icon(Icons.mail),
                    controller: emailEditingController,
                    hint: 'Enter Your Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    perf: Icon(Icons.lock_outline_rounded),
                    sufe: Icon(Icons.visibility),
                    controller: passwordEditingController,
                    hint: 'Enter Your password',
                    textInputType: TextInputType.visiblePassword,
                    isPass: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    perf: Icon(Icons.phone),
                    controller: PhoneNumberEditingController,
                    hint: 'Enter Your Phone Number',
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<AuthBloc>(
                        context,
                      ).add(await signUpEvent(
                          email: emailEditingController.text,
                          password: passwordEditingController.text));
                      /////////////////////////////////////////////////
                      // BlocProvider.of<FirestoreBloc>(
                      //   context,
                      // ).add(
                      //   await AddDataToFirestoreEvent(
                      //     uid2: uid,
                      //     userName: userNameEditingController.text,
                      //     userEmail: emailEditingController.text,
                      //     phoneNumber: PhoneNumberEditingController.text,
                      //     // image:
                      //     //     BlocProvider.of<FirestoreBloc>(context).imageUrl,

                      //     // followers: follower,
                      //     // following: following,
                      //   ),
                      // );
                      //////////////////////////////////////////////////
                      BlocProvider.of<FirestoreBloc>(context).add(
                          await AddDataToStorageCloudEvent(
                              folderName: userNameEditingController.text,
                              uid: uid,
                              file: image!,
                              isPaass: false));
                      /////////////////////////////////////////////////////////

                      ////////////////////////////////////////////////////////
                      // BlocProvider.of<FirestoreBloc>(context)
                      //     .add(await GetDataFromFirestoreEvent(
                      //   userEmail: "userEmail",
                      //   uid: BlocProvider.of<AuthBloc>(context).uid3,
                      // ));
                      ////////////////////////////////////////////////////////////////////
                    },
                    child: isloading
                        ? loadingProgress()
                        : ButtonWidget(
                            text: "Sign Up",
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("you have an account ?  "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Flexible(
                  //   child: Container(),
                  //   flex: 2,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
