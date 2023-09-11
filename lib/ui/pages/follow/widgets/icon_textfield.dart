// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  const IconTextField({
    Key? key,
    required this.assetPath,
    required this.title,
    required this.hintText,
    required this.controller,
  }) : super(key: key);
  final String assetPath;
  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  assetPath,
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Material(
              color: Colors.transparent,
              child: TextField(
                controller: controller,
                cursorColor: Colors.blueAccent,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).primaryColor,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  isDense: true,
                  hintText: hintText,
                  contentPadding: EdgeInsets.only(left: 30),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
