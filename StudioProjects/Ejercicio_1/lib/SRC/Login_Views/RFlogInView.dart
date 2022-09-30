import 'package:ejercicio_1/SRC/Custom_Views/RFinputs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

RFinput_Text input1 = RFinput_Text(
  sTitulo: "Ususario",
);
RFinput_Text input2 = RFinput_Text(
  sTitulo: "Password",
  blIsPassword: true,
);

void btnlog(BuildContext context) async {
  print("--------------->"+input1.getText());
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: input1.getText(),
      password: input2.getText(),
    );
    Navigator.of(context).popAndPushNamed("/Home");
  } on FirebaseAuthException catch (e) {
    print("------->>>>   ERROR DE CREACION DE USUARIO " + e.code);
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  print("USUARIO CREADO CORRECTAMENTE");
}

class RFloginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log  in"),
        backgroundColor: Colors.teal.shade800,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          input1,
          input2,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  btnlog(context);
                },
                child: Text('Acceder'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/Register');
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ]),
      ),
      backgroundColor: Colors.teal.shade200,
    );
  }
}
