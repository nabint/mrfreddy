// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/routes/app_router.gr.dart';
import 'package:mrfreddy/ui/pages/home/widgets/location_tile.dart';
import 'package:mrfreddy/ui/widgets/button.dart';

class TradingCard extends StatelessWidget {
  final ModelTrader trader;
  const TradingCard({
    Key? key,
    required this.trader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            trader.imgUrl,
            height: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),
          LocationTile(
            location: trader.location,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Tradesman",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            trader.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "Placing trades after the market's official closing time but backdating them to the same day's closing price.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButton(
            onTap: () {
              AutoRouter.of(context).push(
                TradingDetail(trader: trader),
              );
            },
            width: double.infinity,
            title: "View Trading Standard",
          )
        ],
      ),
    );
  }
}
