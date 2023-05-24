import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 190),
      child: Text(
        "categories",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
      ),
    );
  }
}
