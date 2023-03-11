import 'package:flutter/material.dart';

class TaskCardModel {
  String startTime;
  String endTime;
  dynamic taskCategory;
  String taskTitle;
  String taskDescription;

  TaskCardModel(
      {required this.startTime,
      required this.endTime,
      required this.taskTitle,
      required this.taskCategory,
      required this.taskDescription});
}
