import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/model/task/task.dart';
import 'package:task_app/services/network_service.dart';

part 'task_controller.freezed.dart';

@freezed
class TaskState with _$TaskState {
  factory TaskState({
    @Default([]) List<Task> tasks,
    @Default(true) bool isLoading,
  }) = _TaskState;
}

class TaskController extends StateNotifier<TaskState> {
  Ref ref;
  TaskController({
    required this.ref,
  }) : super(TaskState()) {
    getAllTask();
  }

  getAllTask() async {
    state = state.copyWith(isLoading: true);
    final response = await ref.read(networkServiceProvider).getTasks();
    log('RESPONSEEE ${response.toString()}');
    state = state.copyWith(isLoading: false, tasks: response);
  }
}

final taskControllerProvider =
    StateNotifierProvider<TaskController, TaskState>((ref) {
  return TaskController(ref: ref);
});
