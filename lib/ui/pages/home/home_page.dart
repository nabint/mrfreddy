import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mrfreddy/routes/app_router.gr.dart';
import 'package:mrfreddy/ui/pages/home/base.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 108,
          ),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(color: Color(0xffFFFFFF)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Leaping Over Dodgy Trades with Your \n",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.5,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Vigilant Watchfrog',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 31.0),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blueAccent,
                    ),
                    keyboardType: TextInputType.none,
                    onTap: () {
                      AutoRouter.of(context)
                          .push(SearchRoute(currentPage: 0));
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Enter tradesman name or business",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 136,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31.0),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text:
                    "Skip the Risk, Jump to Smart Trades with Your Watchfrog Guardian!",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Vigilant Watchfrog',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
