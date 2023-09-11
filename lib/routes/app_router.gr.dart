// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:mrfreddy/data/models/trader.dart' as _i15;
import 'package:mrfreddy/data/models/user.dart' as _i16;
import 'package:mrfreddy/ui/pages/auth/choose_county.dart' as _i1;
import 'package:mrfreddy/ui/pages/auth/signup.dart' as _i9;
import 'package:mrfreddy/ui/pages/auth/verify_otp.dart' as _i12;
import 'package:mrfreddy/ui/pages/home/home_page.dart' as _i3;
import 'package:mrfreddy/ui/pages/home/main_page.dart' as _i4;
import 'package:mrfreddy/ui/pages/home/profile_page.dart' as _i5;
import 'package:mrfreddy/ui/pages/home/search_page.dart' as _i7;
import 'package:mrfreddy/ui/pages/petition/sign_page.dart' as _i8;
import 'package:mrfreddy/ui/pages/report/confirm_report.dart' as _i2;
import 'package:mrfreddy/ui/pages/report/report_page.dart' as _i6;
import 'package:mrfreddy/ui/pages/splash/splash.dart' as _i10;
import 'package:mrfreddy/ui/pages/trading/trading_detail.dart' as _i11;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    ChooseCounty.name: (routeData) {
      final args = routeData.argsAs<ChooseCountyArgs>(
          orElse: () => const ChooseCountyArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChooseCounty(key: args.key),
      );
    },
    ConfirmReportRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmReportRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ConfirmReportPage(
          key: args.key,
          currentPage: args.currentPage,
          trader: args.trader,
          headingController: args.headingController,
          descriptionController: args.descriptionController,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MainPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ProfilePage(
          key: args.key,
          currentPage: args.currentPage,
          trader: args.trader,
        ),
      );
    },
    ReportRoute.name: (routeData) {
      final args = routeData.argsAs<ReportRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ReportPage(
          key: args.key,
          currentPage: args.currentPage,
          trader: args.trader,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SearchPage(
          key: args.key,
          currentPage: args.currentPage,
        ),
      );
    },
    SignRoute.name: (routeData) {
      final args =
          routeData.argsAs<SignRouteArgs>(orElse: () => const SignRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SignPage(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SignUpPage(
          key: args.key,
          county: args.county,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashScreen(),
      );
    },
    TradingDetail.name: (routeData) {
      final args = routeData.argsAs<TradingDetailArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.TradingDetail(
          key: args.key,
          trader: args.trader,
        ),
      );
    },
    VerifyOtp.name: (routeData) {
      final args = routeData.argsAs<VerifyOtpArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.VerifyOtp(
          key: args.key,
          verificationId: args.verificationId,
          user: args.user,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ChooseCounty]
class ChooseCounty extends _i13.PageRouteInfo<ChooseCountyArgs> {
  ChooseCounty({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ChooseCounty.name,
          args: ChooseCountyArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChooseCounty';

  static const _i13.PageInfo<ChooseCountyArgs> page =
      _i13.PageInfo<ChooseCountyArgs>(name);
}

class ChooseCountyArgs {
  const ChooseCountyArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'ChooseCountyArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.ConfirmReportPage]
class ConfirmReportRoute extends _i13.PageRouteInfo<ConfirmReportRouteArgs> {
  ConfirmReportRoute({
    _i14.Key? key,
    required int currentPage,
    required _i15.ModelTrader trader,
    required _i14.TextEditingController headingController,
    required _i14.TextEditingController descriptionController,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ConfirmReportRoute.name,
          args: ConfirmReportRouteArgs(
            key: key,
            currentPage: currentPage,
            trader: trader,
            headingController: headingController,
            descriptionController: descriptionController,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmReportRoute';

  static const _i13.PageInfo<ConfirmReportRouteArgs> page =
      _i13.PageInfo<ConfirmReportRouteArgs>(name);
}

class ConfirmReportRouteArgs {
  const ConfirmReportRouteArgs({
    this.key,
    required this.currentPage,
    required this.trader,
    required this.headingController,
    required this.descriptionController,
  });

  final _i14.Key? key;

  final int currentPage;

  final _i15.ModelTrader trader;

  final _i14.TextEditingController headingController;

  final _i14.TextEditingController descriptionController;

  @override
  String toString() {
    return 'ConfirmReportRouteArgs{key: $key, currentPage: $currentPage, trader: $trader, headingController: $headingController, descriptionController: $descriptionController}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i13.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i14.Key? key,
    required _i16.ModelUser user,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i13.PageInfo<MainRouteArgs> page =
      _i13.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.user,
  });

  final _i14.Key? key;

  final _i16.ModelUser user;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i14.Key? key,
    required int currentPage,
    required _i15.ModelTrader trader,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            currentPage: currentPage,
            trader: trader,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i13.PageInfo<ProfileRouteArgs> page =
      _i13.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.currentPage,
    required this.trader,
  });

  final _i14.Key? key;

  final int currentPage;

  final _i15.ModelTrader trader;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, currentPage: $currentPage, trader: $trader}';
  }
}

/// generated route for
/// [_i6.ReportPage]
class ReportRoute extends _i13.PageRouteInfo<ReportRouteArgs> {
  ReportRoute({
    _i14.Key? key,
    required int currentPage,
    required _i15.ModelTrader trader,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ReportRoute.name,
          args: ReportRouteArgs(
            key: key,
            currentPage: currentPage,
            trader: trader,
          ),
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const _i13.PageInfo<ReportRouteArgs> page =
      _i13.PageInfo<ReportRouteArgs>(name);
}

class ReportRouteArgs {
  const ReportRouteArgs({
    this.key,
    required this.currentPage,
    required this.trader,
  });

  final _i14.Key? key;

  final int currentPage;

  final _i15.ModelTrader trader;

  @override
  String toString() {
    return 'ReportRouteArgs{key: $key, currentPage: $currentPage, trader: $trader}';
  }
}

/// generated route for
/// [_i7.SearchPage]
class SearchRoute extends _i13.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i14.Key? key,
    required int currentPage,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            currentPage: currentPage,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i13.PageInfo<SearchRouteArgs> page =
      _i13.PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    required this.currentPage,
  });

  final _i14.Key? key;

  final int currentPage;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, currentPage: $currentPage}';
  }
}

/// generated route for
/// [_i8.SignPage]
class SignRoute extends _i13.PageRouteInfo<SignRouteArgs> {
  SignRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SignRoute.name,
          args: SignRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignRoute';

  static const _i13.PageInfo<SignRouteArgs> page =
      _i13.PageInfo<SignRouteArgs>(name);
}

class SignRouteArgs {
  const SignRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.SignUpPage]
class SignUpRoute extends _i13.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i14.Key? key,
    required String county,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(
            key: key,
            county: county,
          ),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i13.PageInfo<SignUpRouteArgs> page =
      _i13.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({
    this.key,
    required this.county,
  });

  final _i14.Key? key;

  final String county;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, county: $county}';
  }
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TradingDetail]
class TradingDetail extends _i13.PageRouteInfo<TradingDetailArgs> {
  TradingDetail({
    _i14.Key? key,
    required _i15.ModelTrader trader,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          TradingDetail.name,
          args: TradingDetailArgs(
            key: key,
            trader: trader,
          ),
          initialChildren: children,
        );

  static const String name = 'TradingDetail';

  static const _i13.PageInfo<TradingDetailArgs> page =
      _i13.PageInfo<TradingDetailArgs>(name);
}

class TradingDetailArgs {
  const TradingDetailArgs({
    this.key,
    required this.trader,
  });

  final _i14.Key? key;

  final _i15.ModelTrader trader;

  @override
  String toString() {
    return 'TradingDetailArgs{key: $key, trader: $trader}';
  }
}

/// generated route for
/// [_i12.VerifyOtp]
class VerifyOtp extends _i13.PageRouteInfo<VerifyOtpArgs> {
  VerifyOtp({
    _i14.Key? key,
    required String verificationId,
    required _i16.ModelUser user,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          VerifyOtp.name,
          args: VerifyOtpArgs(
            key: key,
            verificationId: verificationId,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyOtp';

  static const _i13.PageInfo<VerifyOtpArgs> page =
      _i13.PageInfo<VerifyOtpArgs>(name);
}

class VerifyOtpArgs {
  const VerifyOtpArgs({
    this.key,
    required this.verificationId,
    required this.user,
  });

  final _i14.Key? key;

  final String verificationId;

  final _i16.ModelUser user;

  @override
  String toString() {
    return 'VerifyOtpArgs{key: $key, verificationId: $verificationId, user: $user}';
  }
}
