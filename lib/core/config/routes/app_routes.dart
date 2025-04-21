import 'package:event_app/core/config/routes/routes_name.dart';
import 'package:event_app/module/presentation/event_venue_details/screens/event_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show GlobalKey, NavigatorState;
import 'package:go_router/go_router.dart';
final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter goRoute = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RoutesName.eventScreeen,
  routes: [
    GoRoute(path: RoutesName.eventScreeen, builder: (context, state) => EventScreen(),)
  ]

);
