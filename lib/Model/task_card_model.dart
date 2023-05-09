import 'package:flutter/material.dart';

import '../View/screen/add_task_screen.dart';

class TaskCardModel {
  int id;
  String startTime;
  String endTime;
  Color cardColor;
  Color cardTextTitleColor;
  String taskTitle;
  String taskDescription;
  String date;
  String? taskNature;

  TaskCardModel(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.taskTitle,
      required this.cardTextTitleColor,
      required this.cardColor,
      required this.taskDescription,
      required this.date,
      required this.taskNature});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "startTime": startTime,
      "taskTitle": taskTitle,
      "taskDescription": taskDescription,
      "endTime": endTime,
      "date": date,
      "cardColor": cardColor.value,
      "cardTextTitleColor": cardTextTitleColor.value,
      "taskNature": taskNature
    };
  }

  // @override
  // String toString() {
  //   return " TaskCardModel{startTime: $startTime
  //   taskTitle: $taskTitle,
  //   taskDescription: $taskDescription,
  //   endTime: $endTime,
  //   date: $date,
  //   cardColor: $cardColor,
  //   cardTextTitleColor: $cardTextTitleColor}";
}
