// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/ui/pages/home/base.dart';
import 'package:mrfreddy/ui/pages/home/widgets/profile_card.dart';

@RoutePage()
class TradingDetail extends StatelessWidget {
  final ModelTrader trader;

  const TradingDetail({
    Key? key,
    required this.trader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Base(
      current_page: 2,
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
                currentPage: 2,
                trader: trader,
                interactive: false,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Complain",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Providing false or misleading information about a security or investment product to manipulate investor decisions.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: "Action taken by ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' MrFreddy',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor mi a odio sollicitudin, id tincidunt purus blandit. Nulla facilisi. Vivamus mollis, id tincidunt purus blandit. Nulla facilisi. Vivamus mollis, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor mi a odio sollicitudin, id tincidunt purus blandit. Nulla facilisi. Vivamus mollis, id tincidunt purus blandit. Nulla facilisi. Vivamus mollis,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor mi a odio ',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: "Responses by ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Trading Standard',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor mi a odio sollicitudin, id tincidunt purus blandit. Nulla facilisi. Vivamus mollis, id tincidunt purus blandit. Nulla facilisi. Vivamus mollis, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor mi a odio sollicitudin, id tincidunt purus blandit. Nulla facilisi. Vivamus mollis, id tincidunt purus blandit. Nulla facilisi. Vivamus mollis,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor mi a odio ',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
