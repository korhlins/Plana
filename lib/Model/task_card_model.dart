import 'package:flutter/material.dart';

class TaskCardModel {
  String startTime;
  String endTime;
  Color cardColor;
  Color cardTextTitleColor;
  String taskTitle;
  String taskDescription;

  TaskCardModel(
      {required this.startTime,
      required this.endTime,
      required this.taskTitle,
      required this.cardTextTitleColor,
      required this.cardColor,
      required this.taskDescription});
}
