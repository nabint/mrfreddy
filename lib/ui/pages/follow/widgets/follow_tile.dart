// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrfreddy/bloc/auth/auth_bloc.dart';

import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/repositories/trader.dart';
import 'package:mrfreddy/routes/app_router.gr.dart';
import 'package:mrfreddy/ui/pages/home/widgets/location_tile.dart';
import 'package:mrfreddy/ui/pages/home/widgets/stats_tile.dart';
import 'package:mrfreddy/ui/widgets/button.dart';

class FollowTile extends StatelessWidget {
  final ModelTrader trader;
  final Function onTap;
  const FollowTile({
    Key? key,
    required this.trader,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(
          ProfileRoute(currentPage: 1, trader: trader),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(trader.imgUrl),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 30,
            ),

            // Texts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  trader.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w700),
                ),
                LocationTile(location: trader.location),
                StatsTile(
                  title: '${trader.warnings.length} Warnings',
                )
              ],
            ),
            Spacer()
            // Buttons
            ,
            PrimaryButton(
              onTap: () async {
                await TraderRepo().unfollowTrader(
                  context.read<AuthBloc>().user!,
                  trader.id,
                );
                final snackBar = SnackBar(
                  content: Text('You have unfollowed trader ${trader.name}'),
                );

                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                onTap();
              },
              title: "Unfollow",
              width: 72,
              height: 30,
              fontSize: 13,
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
