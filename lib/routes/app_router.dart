import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: VerifyOtp.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: ReportRoute.page),
    AutoRoute(page: ConfirmReportRoute.page),
    AutoRoute(page: SignRoute.page),
    AutoRoute(page: TradingDetail.page),
    AutoRoute(page: ChooseCounty.page),
    AutoRoute(page: SplashRoute.page, initial: true),

  ];
}