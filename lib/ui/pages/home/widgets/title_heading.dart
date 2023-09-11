import 'package:flutter/material.dart';

class TitleHeading extends StatelessWidget {
  final String assetPath;
  final String title;

  const TitleHeading({
    super.key,
    required this.assetPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          width: 23,
          height: 23,
          image: AssetImage(assetPath),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
