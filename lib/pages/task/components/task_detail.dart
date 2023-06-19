import 'package:flutter/material.dart';

import 'package:task_app/model/task/task.dart';

class TaksDetail extends StatelessWidget {
  final Task task;
  const TaksDetail({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Divider(),
          Text(
            task.dateTime?.toIso8601String() ?? "",
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(task.description ?? ""),
          ),
        ],
      ),
    );
  }
}
