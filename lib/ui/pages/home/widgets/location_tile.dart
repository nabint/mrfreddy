// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {
  final String location;
  const LocationTile({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            letterSpacing: 1.1,
            fontWeight: FontWeight.w300),
        children: [
          WidgetSpan(
            child: Icon(Icons.location_pin, size: 14),
          ),
          TextSpan(
            text: location,
          ),
        ],
      ),
    );
  }
}
