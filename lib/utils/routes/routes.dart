import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/00_splash_view/splash_view.dart';
import 'package:mvvm/view/01_login_view/login_view.dart';
import 'package:mvvm/view/02_home_view/home_view.dart';
import 'package:mvvm/view/03_sign_up/signup_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No Route Defines"),
            ),
          );
        });
    }
  }
}
