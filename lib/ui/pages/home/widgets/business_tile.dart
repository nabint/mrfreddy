// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BusinessTile extends StatelessWidget {
  final String title;
  const BusinessTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width:20,
          ),
          Image.asset(
            "assets/icons/briefcase.png",
            width: 25,
            height: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          // Container(
          //   width: 200,
          //   child: Text(
          //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim",
          //     maxLines: 3,
          //     textAlign: TextAlign.justify,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //         color: Theme.of(context).colorScheme.onSecondary,
          //         fontSize: 12,
          //         fontWeight: FontWeight.w400),
          //   ),
          // ),
        ],
      ),
    );
  }
}
