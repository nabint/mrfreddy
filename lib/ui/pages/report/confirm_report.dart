// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/repositories/warnings.dart';
import 'package:mrfreddy/ui/pages/home/base.dart';
import 'package:mrfreddy/ui/pages/home/widgets/profile_card.dart';
import 'package:mrfreddy/ui/widgets/button.dart';
import 'package:mrfreddy/ui/widgets/dialogs.dart';

@RoutePage()
class ConfirmReportPage extends StatelessWidget {
  final int currentPage;
  final ModelTrader trader;
  final TextEditingController headingController;
  final TextEditingController descriptionController;

  ConfirmReportPage({
    Key? key,
    required this.currentPage,
    required this.trader,
    required this.headingController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Base(
      current_page: currentPage,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/icons/back.png",
                  height: 30,
                  width: 67,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileCard(
                currentPage: currentPage,
                trader: trader,
                interactive: false,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Heading",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                child: Text(
                  '(Summarise the incident briefly. E.g., "Incomplete Work and Overcharged")Under this, include a note: "Be honest and truthful. The aim is to warn and safeguard others from potential harm, not to defame."',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: headingController,
                enabled: false,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Color(0xffAAAAAA),
                  ),
                  hintText: "Type in your text",
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Incident Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please be detailed and specific. Narrate the events or actions that prompted this report. Be factual, clear, and concise.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                maxLines: 7,
                controller: descriptionController,
                enabled: false,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Color(0xffAAAAAA),
                  ),
                  hintText: "Type in your text",
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                onTap: () async {
                  await WarningRepo().addBusiness(
                    trader,
                    {
                      "title": headingController.text,
                      "description": descriptionController.text
                    },
                  );
                  reportDialog(context);
                },
                width: double.infinity,
                title: "Report",
              )
            ],
          ),
        ),
      ),
    );
  }
}
