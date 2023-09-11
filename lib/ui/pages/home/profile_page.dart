import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/ui/pages/home/base.dart';
import 'package:mrfreddy/ui/pages/home/widgets/business_tile.dart';
import 'package:mrfreddy/ui/pages/home/widgets/profile_card.dart';
import 'package:mrfreddy/ui/pages/home/widgets/title_heading.dart';
import 'package:mrfreddy/ui/pages/home/widgets/warnings_tile.dart';
import 'package:mrfreddy/ui/widgets/dialogs.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  final int currentPage;
  final ModelTrader trader;
  const ProfilePage(
      {super.key, required this.currentPage, required this.trader});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ModelTrader trader=widget.trader;

  late List<Widget> businessWidgets;
  late List<Widget> warningWidgets;


  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    businessWidgets = trader.business
        .map(
          (e) => BusinessTile(
            title: e['name'],
          ),
        )
        .toList();

    warningWidgets = trader.warnings
        .map(
          (e) => WarningTile(
            title: e['title'],
            description: e['description'],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    businessWidgets = trader.business
        .map(
          (e) => BusinessTile(
            title: e['name'],
          ),
        )
        .toList();

        
    return Base(
      current_page: widget.currentPage,
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
                currentPage: widget.currentPage,
                trader: trader,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              TitleHeading(
                assetPath: "assets/icons/suitcase.png",
                title: "Known Business Name",
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: businessWidgets,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await addBusinessDialog(context, widget.trader);
                  setState(() {
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 35,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                    "Add business name",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
              
              SizedBox(
                height: 20,
              ),
              TitleHeading(
                assetPath: "assets/icons/warning.png",
                title: "Warnings",
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: warningWidgets,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
