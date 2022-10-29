import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instgram_clone/presentaion/screen/auth_screen/sign_up_screen.dart';
import 'package:instgram_clone/presentaion/screen/mobile_screen.dart';
import 'package:instgram_clone/presentaion/screen/web_screen.dart';
import 'package:instgram_clone/presentaion/widget/snack_bar.dart';
import 'package:instgram_clone/utilis/color_const/colors.dart';
import 'package:instgram_clone/utilis/core/responsive_screen.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../widget/button_widget.dart';
import '../../widget/circular_progress.dart';
import '../../widget/textField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailEditingController =
        TextEditingController();
    final TextEditingController passwordEditingController =
        TextEditingController();
    bool isloading = false;

    final String assetName = 'assets/ic_instagram.svg';

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is loadingLogInState) {
            isloading = true;
            // loadingProgress();
            print("loading zzzzzzzzzzzzzzzzz");
          } else if (state is successLogInState) {
            isloading = false;
            SnackBarWidget().snackBarSuccess(
                message: state.succesMessage, context: context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: ((context) => ResponsiveScreen(
                        MobileScreen: MobileScreen(), WebScreen: WebScreen()))),
                (route) => false);

            print("succsess zzzzzzzzzzzzzzzzz");
          } else if (state is ErrorLogInState) {
            SnackBarWidget()
                .snackBarErorr(message: state.errorMessage, context: context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 150),
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                children: [
                  SvgPicture.asset(
                    assetName,
                    height: 60,
                    color: primaryColor,
                  ),
                  SizedBox(
                    height: 60,
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
                    controller: passwordEditingController,
                    hint: 'Enter Your password',
                    textInputType: TextInputType.visiblePassword,
                    isPass: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LogInEvent(
                          email: emailEditingController.text,
                          password: passwordEditingController.text));
                    },
                    child: isloading
                        ? loadingProgress()
                        : ButtonWidget(
                            text: "Log In",
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" Don't have an account ?  "),
                        GestureDetector(
                          onTap: () async {
                            
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SignUpScreen())));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
