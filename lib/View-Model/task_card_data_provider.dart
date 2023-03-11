import 'package:flutter/material.dart';
import 'package:plana/Model/task_card_model.dart';

class TaskCardDataProvider extends ChangeNotifier {
  List<TaskCardModel> task = [];

  get itemCount {
    return task.length;
  }

  get startTime {
    return;
  }

  void addToTaskList(
      {required String startTime,
      required String taskTitle,
      required String endTime,
      dynamic taskCategory,
      required String taskDescription}) {
    task!.add(TaskCardModel(
        startTime: startTime,
        endTime: endTime,
        taskTitle: taskTitle,
        taskCategory: taskCategory,
        taskDescription: taskDescription));
    notifyListeners();
  }
}
