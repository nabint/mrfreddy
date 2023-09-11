import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/repositories/trader.dart';
import 'package:mrfreddy/ui/pages/home/base.dart';
import 'package:mrfreddy/ui/widgets/dialogs.dart';
import 'package:mrfreddy/ui/pages/home/widgets/search_field.dart';
import 'package:mrfreddy/ui/pages/home/widgets/profile_list.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  final int currentPage;
  const SearchPage({super.key, required this.currentPage});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  List<ModelTrader>? allTraders;
  List<ModelTrader>? filteredTraders;
  bool loading=false;

  @override
  void initState() {
    super.initState();

    TraderRepo().getAllTraders().then(
      (value) {
        allTraders = value;
        if (allTraders != null) {
          filteredTraders = [...allTraders!];
        } else {
          filteredTraders = [];
        }
        setState(() {});
      },
    );
  }

  void refreshTraders() async{
    allTraders  = await TraderRepo().getAllTraders();
    filteredTraders = [...allTraders!];
    setState(() {});
  }

  callback() {
    if (filteredTraders != [] && filteredTraders != null) {
      filteredTraders!.clear();
      if (controller.text.isEmpty) {
        filteredTraders = [...allTraders!];
      } else {
        filteredTraders = allTraders!
            .where(
              (element) =>
                  element.name.toLowerCase().startsWith(controller.text.trim()),
            )
            .toList();
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Base(
      current_page: widget.currentPage,
      child: filteredTraders == null || loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 31.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/icons/back.png",
                      height: 30,
                      width: 67,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SearchField(
                    controller: controller,
                    callback: callback,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: "Search Result for \t\t",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 1.1,
                                fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                text: controller.text,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          addTraderDialog(context, refreshTraders);
                        },
                        child: Container(
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                              Center(
                                child: Text(
                                  "Add Trader",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredTraders!.length,
                      itemBuilder: (context, id) {
                        return ProfileList(trader: filteredTraders![id]);
                      },
                    ),
                  ),
                  // ProfileList()
                ],
              ),
            ),
    );
  }
}
