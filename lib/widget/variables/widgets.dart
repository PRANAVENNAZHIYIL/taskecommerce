import 'package:flutter/material.dart';

ValueNotifier<String> valueNotifierColor = ValueNotifier('S');
Widget buttons4(String name) {
  return GestureDetector(
    onTap: () {
      valueNotifierColor.value = name;
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        // border: Border.all(width: 1),
        color: valueNotifierColor.value == name ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: valueNotifierColor.value == name
                  ? Colors.white
                  : Colors.black),
        ),
      ),
    ),
  );
}
