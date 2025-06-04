import 'package:flutter/material.dart';
import 'package:go_eco/pages/tabs/Track.dart';
import '../pages/tabs/Activities.dart';
import '../pages/tabs/Leaderboard.dart';
import '../pages/tabs/Profile.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/tabs/Login.dart';
import '../pages/tabs/Register.dart';

//configure your button route here
final Map routes = {
  "/Tabs": (context, {arguments}) => Tabs(arguments: arguments),
  "/Track": (context) => const TrackPage(),
  "/Activities": (context, {arguments}) => ActivitiesPage(arguments:
  arguments),
  "/Leaderboard": (context,{arguments}) =>  LeaderboardPage(arguments: arguments),
  "/Profile": (context, {arguments}) => ProfilePage(arguments: arguments,),
  "/Login": (context) => const LoginPage(),
  "/Register": (context) => const RegisterPage(),
};

//do not modify this.
var onGenerateRoute = (RouteSettings settings){
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};