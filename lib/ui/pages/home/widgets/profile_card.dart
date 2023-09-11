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
import 'package:mrfreddy/ui/widgets/snackbar.dart';

class ProfileCard extends StatefulWidget {
  final int currentPage;
  final ModelTrader trader;
  final bool interactive;

  const ProfileCard({
    Key? key,
    required this.currentPage,
    required this.trader,
    this.interactive = true,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  late bool isFollowed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFollowed = context
        .read<AuthBloc>()
        .user!
        .followedTraders
        .contains(widget.trader.id);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(widget.trader.imgUrl),
          fit: BoxFit.cover,
          height: 117,
          width: 117,
        ),
        SizedBox(
          width: 45,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.trader.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Tradesman",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            LocationTile(location: widget.trader.location),
            SizedBox(
              height: 10,
            ),
            Text(
              "Be updated on this tradesman",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            widget.interactive == true
                ? InkWell(
                    onTap: () {
                      String content;
                      if (isFollowed) {
                        TraderRepo().unfollowTrader(
                          context.read<AuthBloc>().user!,
                          widget.trader.id,
                        );
                        content =
                            'You have unfollowed trader ${widget.trader.name}';
                      } else {
                        TraderRepo().followTrader(
                          context.read<AuthBloc>().user!,
                          widget.trader.id,
                        );
                        content =
                            'You have followed trader ${widget.trader.name}';
                      }

                      displaySnackBar(context, content);
                      isFollowed = !isFollowed;
                      setState(() {});
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text(
                              isFollowed ? "Unfollow" : "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Image(
                            width: 12,
                            height: 12,
                            image: AssetImage(
                              "assets/icons/add_friend.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                StatsTile(
                    isFollow: true,
                    title: widget.trader.followerCount.toString()),
                SizedBox(
                  width: 20,
                ),
                StatsTile(
                  title: '${widget.trader.warnings.length} Warnings',
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            widget.interactive
                ? InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(
                        ReportRoute(
                          currentPage: 1,
                          trader: widget.trader,
                        ),
                      );
                    },
                    child: Container(
                      width: 161,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onSecondary,
                            width: 1.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/warning.png",
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Center(
                            child: Text(
                              "Report",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container()
          ],
        )
      ],
    );
  }
}
