import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:task_app/controllers/task_controller.dart';
import 'package:task_app/model/task/task.dart';
import 'package:task_app/pages/task/components/task_detail.dart';
import 'package:task_app/pages/task/components/task_tile.dart';
import 'package:task_app/routes/routes_action.dart';
import 'package:task_app/routes/routes_name.dart';
import 'package:task_app/utils/responsive.dart';

class TaskScreen extends ConsumerStatefulWidget {
  final String taskId;
  const TaskScreen({
    super.key,
    required this.taskId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = ref.watch(taskControllerProvider).tasks;
    bool isLoading = ref.watch(taskControllerProvider).isLoading;

    return Scaffold(
      body: isLoading
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Responsive.isMobile(context)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) => TaskTile(
                            openedtaskId: widget.taskId,
                            task: tasks[index],
                            onTap: () {
                              if (tasks[index].id != null) {
                                RoutesAction.instance.onPush(context,
                                    "${RouteName.taskRoute}/${tasks[index].id}");
                              }
                            }),
                        itemCount: tasks.length,
                      ),
                    )
                  : Row(children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemBuilder: (context, index) => TaskTile(
                              openedtaskId: widget.taskId,
                              task: tasks[index],
                              onTap: () {
                                if (tasks[index].id != null) {
                                  RoutesAction.instance.onPush(context,
                                      "${RouteName.taskRoute}/${tasks[index].id}");
                                }
                              }),
                          itemCount: tasks.length,
                        ),
                      )),
                      Expanded(
                          child: TaksDetail(
                        task: tasks.firstWhere(
                          (f) => f.id == widget.taskId,
                        ),
                      ))
                    ]),
            ),
    );
  }
}
