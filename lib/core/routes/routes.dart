import 'package:app/core/routes/routes_pages_names.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_view/home_view.dart';
import '../../features/login/login_view/login_view.dart';


class Routes{
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPagesNames.loginView:
        return MaterialPageRoute(builder: (context) =>const LoginView());
        case RoutesPagesNames.homeView :
        return MaterialPageRoute(builder: (context) => HomeView());
      default:
        return MaterialPageRoute(builder: (context) =>const LoginView());
    }

  }
}