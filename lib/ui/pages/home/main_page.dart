import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrfreddy/bloc/navigation/navigation_cubit.dart';
import 'package:mrfreddy/data/models/user.dart';
import 'package:mrfreddy/ui/pages/follow/follow_page.dart';
import 'package:mrfreddy/ui/pages/home/base.dart';
import 'package:mrfreddy/ui/pages/home/home_page.dart';
import 'package:mrfreddy/ui/pages/petition/petition_page.dart';
import 'package:mrfreddy/ui/pages/trading/trading_page.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  final ModelUser user;
  const MainPage({super.key, required this.user});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late HomePage _homePage;
  late FollowPage _followPage;
  late TradingPage _tradingPage;
  late PetitionPage _petitionPage;

  final pageController = PageController();

  List<Widget> navItems = [];

  @override
  void initState() {
    _homePage = const HomePage();
    _followPage = const FollowPage();
    _tradingPage = TradingPage();
    _petitionPage = PetitionPage();

    navItems.add(_homePage);
    navItems.add(_followPage);
    navItems.add(_tradingPage);
    navItems.add(_petitionPage);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, int>(
      listener: (context, state) {
        if (pageController.hasClients) {
          pageController.jumpToPage(state);
        }
      },
      builder: (context, state) {
        return Base(
          current_page: state,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (_) {},
            children: navItems,
          ),
        );
      },
    );
  }
}
