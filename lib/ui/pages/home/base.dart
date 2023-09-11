import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrfreddy/bloc/navigation/navigation_cubit.dart';

class Base extends StatelessWidget {
  final int current_page;
  final Widget child;
  const Base({super.key, required this.child, required this.current_page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current_page,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          onTap: (i) {
            final hasPagePushed = Navigator. of(context). canPop();
            if (hasPagePushed){
              Navigator.of(context).popUntil((route) => route.isFirst);
            }

            context.read<NavigationCubit>().setPage(i);
            
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/icons/nav_home_active.png",
                height: 26.0,
                width: 26.0,
              ),
              icon: Image.asset(
                "assets/icons/nav_home.png",
                height: 26.0,
                width: 26.0,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/icons/nav_follow_active.png",
                height: 26.0,
                width: 26.0,
              ),
              icon: Image.asset(
                "assets/icons/nav_follow.png",
                height: 26.0,
                width: 26.0,
              ),
              label: "Follow",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/icons/nav_shake_active.png",
                height: 26.0,
                width: 26.0,
              ),
              icon: Image.asset(
                "assets/icons/nav_shake.png",
                height: 26.0,
                width: 26.0,
              ),
              label: "Trading Standard",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/icons/nav_petition_active.png",
                height: 26.0,
                width: 26.0,
              ),
              icon: Image.asset(
                "assets/icons/nav_petition.png",
                height: 26.0,
                width: 26.0,
              ),
              label: "Petition",
            ),
          ]),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31.0),
      child: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.cover,
            height: 30,
            width: 120,
          ),
        ],
      ),
    );
  }

  Widget navBar(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Image(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.cover,
          height: 30,
          width: 120,
        ),
      ],
    );
  }
}
