import 'package:flutter/material.dart';

class StatsTile extends StatelessWidget {
  final bool isFollow;
  final String title;
  const StatsTile({super.key, this.isFollow = false, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isFollow
            ? Image.asset(
                "assets/icons/check.png",
                width: 12,
                height: 12,
              )
            : Image.asset("assets/icons/warning.png", width: 12, height: 12),
        SizedBox(width: 5,),
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 11, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
