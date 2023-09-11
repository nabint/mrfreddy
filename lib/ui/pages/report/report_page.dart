// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/routes/app_router.gr.dart';
import 'package:mrfreddy/ui/pages/home/base.dart';
import 'package:mrfreddy/ui/pages/home/widgets/profile_card.dart';
import 'package:mrfreddy/ui/widgets/button.dart';

@RoutePage()
class ReportPage extends StatelessWidget {
  final int currentPage;
  final ModelTrader trader;
  TextEditingController headingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  ReportPage({
    Key? key,
    required this.currentPage,
    required this.trader,
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
                  fillColor: Color(0xffE1E1E1),
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
                  fillColor: Color(0xffE1E1E1),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                onTap: () {
                  AutoRouter.of(context).replace(
                    ConfirmReportRoute(
                      currentPage: 1,
                      descriptionController: descriptionController,
                      headingController: headingController,
                      trader: trader,
                    ),
                  );
                },
                width: double.infinity,
                title: "Done",
              )
            ],
          ),
        ),
      ),
    );
  }
}
