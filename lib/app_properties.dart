import 'package:flutter/material.dart';

const Color yellow = Color.fromARGB(255, 101, 84, 253);
const Color mediumYellow = Color.fromARGB(255, 76, 70, 253);
const Color darkYellow = Color.fromARGB(255, 57, 34, 233);
const Color transparentYellow = Color.fromARGB(177, 70, 79, 253);
const Color darkGrey = Color(0xff202020);
const colorBackground = Color(0xFF5800FF);
const colorPrimary = Color(0xFF0096FF);
const colorSecondary = Color(0xFF00D7FF);
const colorThree = Color.fromARGB(255, 3, 0, 162);
const colorAccent = Color(0xFFFFFFFF);
const colorTextTitle = Color(0XFFE3FDFD);
const colorTop = Color.fromARGB(255, 104, 93, 255);

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}

class InfoMessage {
  static snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
