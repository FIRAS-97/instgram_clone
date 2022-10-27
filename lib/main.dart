import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_clone/presentaion/bloc/add_image/add_image_bloc.dart';
import 'package:instgram_clone/presentaion/bloc/auth_bloc/auth_bloc.dart';
import 'package:instgram_clone/presentaion/bloc/firestore_bloc/firestore_bloc.dart';
import 'package:instgram_clone/presentaion/screen/mobile_screen.dart';
import 'package:instgram_clone/utilis/core/responsive_screen.dart';
import 'presentaion/screen/auth_screen/login_screen.dart';
import 'presentaion/screen/web_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCJctKdgEA98lDQKzVKsJdepFfmwnM1r6Q',
        appId: '1:90571745984:web:198968011ed30a26f01b25',
        messagingSenderId: '90571745984',
        projectId: 'instgram-clone-2e7e9',
        authDomain: 'instgram-clone-2e7e9.firebaseapp.com',
        storageBucket: 'instgram-clone-2e7e9.appspot.com',
      ),
    );
    //
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyB5f1RKu3uauPCW-AJcER38ZygLe7OqvMk',
        appId: '1:90571745984:android:fc86e04bac05b764f01b25',
        messagingSenderId: '90571745984',
        projectId: 'instgram-clone-2e7e9',
        storageBucket: 'instgram-clone-2e7e9.appspot.com',
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get mobileBackgroundColor => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => FirestoreBloc(),
        ),
        BlocProvider(
          create: (context) => AddImageBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instgram Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: ResponsiveScreen(
          WebScreen: WebScreen(),
          MobileScreen: MobileScreen(),
          LoginScreen: LoginScreen(),
        ),
      ),
    );
  }
}
