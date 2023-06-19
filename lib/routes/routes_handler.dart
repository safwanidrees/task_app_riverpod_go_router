import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/pages/project/project_screen.dart';
import 'package:task_app/pages/task/task_screen.dart';
import 'package:task_app/pages/team/team_screen.dart';
import 'package:task_app/routes/routes_name.dart';
import 'package:task_app/routes/routes_observer.dart';
import 'package:task_app/widget/dashboard.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  observers: [GoRouterObserver()],
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Dashboard(pageName: state.location, body: child);
      },
      routes: [
        GoRoute(
          path: RouteName.projectRoute,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) {
            return const ProjectScreen();
          },
        ),
        GoRoute(
          path: '${RouteName.taskRoute}/:fid',
          builder: (context, state) {
            final fid = state.pathParameters['fid']!;
            return TaskScreen(
              key: state.pageKey,
              taskId: fid,
            );
          },
        ),
        GoRoute(
            path: RouteName.teamRoute,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) {
              return const TeamScreen();
            }),
      ],
    ),
  ],
);
