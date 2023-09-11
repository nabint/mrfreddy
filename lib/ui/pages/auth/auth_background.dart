import 'package:flutter/material.dart';

class AuthBackGround extends StatelessWidget {
  final Widget child;
  const AuthBackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(""),
          fit: BoxFit.cover,
        ),
      ),
      child: child,

    );
  }
}