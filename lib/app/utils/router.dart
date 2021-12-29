import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_navigation/slide_left_route.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_navigation/slide_right_route.dart';
import 'package:dhiaeddine_belkhiria/ui/views/auth/login/login_view.dart';
import 'package:dhiaeddine_belkhiria/ui/views/home/home_view.dart';
import 'package:dhiaeddine_belkhiria/ui/views/unknown_route/unknown_route_view.dart';
import 'package:flutter/material.dart';

const String startUpScreenRoute = "/";
const String homeScreenRoute = "/home";
const String loginScreenRoute = "/login";
const String registerScreeRoute = "/sign_up";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginScreenRoute:
        return SlideRightRoute(page: LoginView());
    case homeScreenRoute:
      return SlideRightRoute(page: HomeView(showVideoList: true,));
    default:
      return SlideLeftRoute(page: UnknownRouteView());
  }
}