import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; 
import 'package:tugas05/modules/home_screen/home_screen.dart';
import 'package:tugas05/modules/news_detail_screen/news_detail_screen.dart';
import 'package:tugas05/modules/splash_screen.dart/spalsh_screen.dart';


import '../models/user.dart';

class AppRoutes {
  static const String splash = "splash";
  static const String home = "home";
  static const String newsDetail = "news-detail";
  static const String newsDetailHot = "news-detail-hot";

  static Page _splahScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: SplashScreen(),
    );
  }

  static Page _homeScreenBuilder(BuildContext context, GoRouterState state) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra! as User;
    } else {
      user = User(
        id: 002,
        name: "Syifa Fauziah",
        username: "syf",
        email: "2006133@itg.ac.id",
        profilePhoto:
            "data:image/jpeg;base64,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",
        phoneNumber: "087717179051",
      );
    }
    return MaterialPage(
      child: HomeScreen(
        user: user,
      ),
    );
  }

  static Page _newsDetailScreenBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      child: NewsDetailScreen(
        id: state.params["id"]!,
      ),
    );
  }

  static Page _newsDetailScreenHotBuilder(BuildContext context,GoRouterState state,) 
  {
    return  const MaterialPage(
      child: NewsDetailScreenHot(newsDetailHot: newsDetailHot),
      );
    }

  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splahScreenBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenBuilder,
        routes: [
          GoRoute(
            name: newsDetail,
            path: "news-detail:id",
            pageBuilder: _newsDetailScreenBuilder,
          ),
        ],
      ),
      GoRoute(
        name: newsDetailHot,
        path: "/news-detail-hot",
        pageBuilder: _newsDetailScreenHotBuilder,
      ),
    ],
    initialLocation: "/splash",
  );
}