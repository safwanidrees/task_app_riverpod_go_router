import 'package:flutter/material.dart';

import 'package:task_app/model/task/task.dart';
import 'package:task_app/pages/task/components/task_detail.dart';
import 'package:task_app/utils/responsive.dart';

class TaskTile extends StatelessWidget {
  final String openedtaskId;
  final Task task;
  final VoidCallback onTap;
  const TaskTile(
      {Key? key,
      required this.task,
      required this.onTap,
      required this.openedtaskId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListTile(
            onTap: onTap,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: const Color.fromARGB(255, 222, 222, 222),
            title: Text(
              task.title ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              task.dateTime?.toIso8601String() ?? "",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Responsive.isMobile(context) && openedtaskId == task.id
            ? TaksDetail(
                task: task,
              )
            : const SizedBox(),
      ],
    );
  }
}
