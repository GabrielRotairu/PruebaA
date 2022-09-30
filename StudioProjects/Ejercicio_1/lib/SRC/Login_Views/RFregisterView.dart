import 'package:ejercicio_1/SRC/Custom_Views/RFinputs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RFregisterView extends StatelessWidget {
  RFregisterView({Key? key}) : super(key: key);

  void btnRegister(
      String emailAddres, String password, BuildContext context) async {

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:emailAddres,
          password: password,
        );
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

      print("Usuario creado correctamente :) ");
    }




  @override
  Widget build(BuildContext context) {
    RFinput_Text input1 = RFinput_Text(
      sTitulo: "Ususario",
    );
    RFinput_Text input2 = RFinput_Text(
      sTitulo: "Password",
      blIsPassword: true,
    );
    RFinput_Text input3 = RFinput_Text(
      sTitulo: "Password",
      blIsPassword: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
        backgroundColor: Colors.teal.shade800,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          input1,
          input2,
          input3,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (input2.getText() == input3.getText()) {
                    btnRegister(input1.getText(), input2.getText(), context);
                  }
                },
                child: Text('Registrarse'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/Login');
                },
                child: Text('Volver a Iniciar Sesión'),
              ),
            ],
          )
        ],
      )),
      backgroundColor: Colors.teal.shade200,
    );
  }
}
