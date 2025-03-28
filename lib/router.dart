import 'package:flutter/cupertino.dart';
import 'package:flutter_train_app/home_page.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';
import 'package:go_router/go_router.dart';

class CustomRouter {
  CustomRouter._();
  static final CustomRouter _instance = CustomRouter._();
  factory CustomRouter() => _instance;

  GoRouter createRouter({required String initialRoute}) {
    return GoRouter(
      initialLocation:
          // OnboardingPage.path,
          initialRoute,
      routes: [
        GoRoute(
          path: '/',
          pageBuilder:
              (context, state) => const CupertinoPage(child: HomePage()),
        ),
        GoRoute(
          path: '/station-list',
          pageBuilder:
              (context, state) => CupertinoPage(
                child: StationListPage(
                  title: (state.extra as Map)['title'],
                  selectedStation: (state.extra as Map)['selectedStation'],
                ),
              ),
        ),
        GoRoute(
          path: '/seat-page',
          pageBuilder: (context, state) => CupertinoPage(
            child: SeatPage(
              departure: (state.extra as Map)['departure'],
              arrival: (state.extra as Map)['arrival'],
            ),
          ),
        ),
      ],
    );
  }
}
