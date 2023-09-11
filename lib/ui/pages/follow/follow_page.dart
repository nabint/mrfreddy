import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrfreddy/bloc/auth/auth_bloc.dart';
import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/repositories/trader.dart';
import 'package:mrfreddy/ui/pages/follow/widgets/follow_tile.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  void callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TraderRepo().getFollowedTrader(
          context.read<AuthBloc>().user!,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ModelTrader?>? traders = snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Follow",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: traders!.length,
                      itemBuilder: (context, id) {
                        return FollowTile(
                          trader: traders[id]!,
                          onTap: callback,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.data == []) {
            return Center(
              child: Text("You haven't followed any traders"),
            );
          }

          return Center(child: CircularProgressIndicator());
        });
  }
}
