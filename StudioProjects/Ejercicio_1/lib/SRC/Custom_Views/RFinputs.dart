import 'package:flutter/material.dart';

class RFinput_Text extends StatelessWidget {
  final String sTitulo;
  final bool blIsPassword;
  final TextEditingController myController = TextEditingController(text: "");

  RFinput_Text({Key? key, this.sTitulo = "", this.blIsPassword = false})
      : super(key: key);

  String getText() {
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: blIsPassword,
      controller: myController,
      cursorColor: Colors.deepOrange,
      maxLength: 20,
      onChanged: (String s) {
        print("------------------>>>>>>>>>>>>>>>>>  " + s);
      },
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: sTitulo,
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: ' ',
        suffixIcon: Icon(
          Icons.lock_outline,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );
  }
}

/*class RFinput_Text_Password extends StatelessWidget {
  final String sTitulo;
  final bool blIsPassword;
  final TextEditingController myController = TextEditingController(text: "");

  RFinput_Text_Password(
      {Key? key, this.sTitulo = "", this.blIsPassword = false})
      : super(key: key);

  String getText() {
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: blIsPassword,
      controller: myController,
      // initialValue: '',
      maxLength: 10,
      decoration: InputDecoration(
        icon: Icon(Icons.lock_rounded),
        labelText: 'Contraseña : ',
        labelStyle: TextStyle(
          color: Color(0xFFc7a500),
        ),
        suffixIcon: Icon(
          Icons.password,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF484848)),
        ),
      ),
    );
  }
}
*/
