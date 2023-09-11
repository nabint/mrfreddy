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
import 'package:mrfreddy/ui/widgets/outline_button.dart';
import 'package:mrfreddy/ui/widgets/snackbar.dart';

class ProfileList extends StatefulWidget {
  final ModelTrader trader;
  const ProfileList({super.key, required this.trader});

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
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
    return Container(
      height: 80,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(widget.trader.imgUrl),
            backgroundColor: Colors.transparent,
          ),
          // Texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.trader.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w700),
              ),
              LocationTile(
                location: widget.trader.location,
              ),
              StatsTile(
                title: '${widget.trader.warnings.length} Warnings',
              )
            ],
          )

          // Buttons
          ,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                onTap: () {
                  AutoRouter.of(context).replace(
                    ProfileRoute(currentPage: 0, trader: widget.trader),
                  );
                },
                title: "View",
                width: 72,
                height: 25,
                fontSize: 13,
              ),
              SizedBox(
                height: 8,
              ),
              OutlineButton(
                title: isFollowed ? "UnFollow" : "Follow",
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
                    content = 'You have followed trader ${widget.trader.name}';
                  }

                  displaySnackBar(context, content);
                  isFollowed = !isFollowed;
                  setState(() {});
                },
                width: 72,
                height: 25,
                fontSize: 13,
              )
            ],
          )
        ],
      ),
    );
  }
}
