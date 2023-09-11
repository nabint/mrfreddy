import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrfreddy/bloc/auth/auth_bloc.dart';
import 'package:mrfreddy/routes/app_router.gr.dart';
import 'package:mrfreddy/ui/pages/home/main_page.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showSplashScreen = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      context.read<AuthBloc>().add(AutoLoginEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              setState(
                () {
                  showSplashScreen = false;
                },
              );
              AutoRouter.of(context).replace(ChooseCounty());
            } else if (state is AuthSuccess) {
              AutoRouter.of(context).replace(ChooseCounty());

              // AutoRouter.of(context).replace(
              //   MainRoute(user: state.user),
              // );
            }
          },
          child: Center(child: Text("Splash Screen")),
          // child: showSplashScreen ? splashScreen() : getStartedScreen(context),
        ),
      ),
    );
  }
}
