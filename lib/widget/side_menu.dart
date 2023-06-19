import 'package:flutter/material.dart';
import 'package:task_app/routes/routes_action.dart';
import 'package:task_app/routes/routes_name.dart';
import 'package:task_app/utils/responsive.dart';
import 'package:task_app/widget/sidemenu_tile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: FlutterLogo(
              size: 150,
            ),
          ),
          SideMenuTile(
            title: "Project",
            onPress: () {
              if (!Responsive.isDesktop(context)) {
                Navigator.pop(context);
              }
              RoutesAction.instance.onPush(context, RouteName.projectRoute);
            },
          ),
          SideMenuTile(
            title: "Task",
            onPress: () {
              if (!Responsive.isDesktop(context)) {
                Navigator.pop(context);
              }
              RoutesAction.instance.onPush(context, '${RouteName.taskRoute}/1');
            },
          ),
          SideMenuTile(
            title: "Team",
            onPress: () {
              if (!Responsive.isDesktop(context)) {
                Navigator.pop(context);
              }
              RoutesAction.instance.onPush(context, RouteName.teamRoute);
            },
          ),
        ],
      ),
    );
  }
}
