import 'package:ejercicio_1/SRC/Home_Views/HomeView.dart';
import 'package:ejercicio_1/SRC/Login_Views/RFlogInView.dart';
import 'package:ejercicio_1/SRC/Login_Views/RFregisterView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  String isUserLogged() {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/Login';
    } else {
      return "/Home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isUserLogged(),
      routes: {
        '/Login': (context) => RFloginView(),
        '/Register': (context) => RFregisterView(),
        '/Home': (context) => HomeView(),
      },
    );
  }
}
