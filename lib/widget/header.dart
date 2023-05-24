import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Image.asset(
        'assets/images/heading.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
