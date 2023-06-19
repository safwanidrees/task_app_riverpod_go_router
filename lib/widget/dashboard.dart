import 'package:flutter/material.dart';

import 'package:task_app/utils/responsive.dart';
import 'package:task_app/widget/side_menu.dart';

class Dashboard extends StatelessWidget {
  final String pageName;
  final Widget body;
  const Dashboard({
    Key? key,
    required this.pageName,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  const Expanded(
                    child: SideMenu(),
                  ),
                Expanded(
                  flex: 5,
                  child: body,
                ),
              ],
            ),
            !Responsive.isDesktop(context)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu));
                    }),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
