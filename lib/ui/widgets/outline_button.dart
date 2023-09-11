import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final double fontSize;
  final Function() onTap;

  const OutlineButton({super.key, required this.title, this.width=143, this.height=43, this.fontSize=18, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
            title,
            style:  TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
