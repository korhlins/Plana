import 'package:flutter/material.dart';
import 'package:plana/Model/task_card_model.dart';
import 'package:plana/View/utilities/Date_Utillities.dart';

class TaskCardDataProvider extends ChangeNotifier {
  List<TaskCardModel> task = [];

  String startTime = DateUtillities().getTimeFormat(0, 0);
  String endTime = DateUtillities().getTimeFormat(0, 0);
  String date = DateUtillities().getDateFormat(0, 0, 0);
  Color? cardColor;
  Color? cardBorderColor;

  int get itemCount {
    return task.length;
  }

  String get getPickedStartTime {
    return startTime;
  }

  String get getPickedEndTime {
    return endTime;
  }

  String get getPickedDate {
    return date;
  }

  Color get getCardColor {
    return cardColor!;
  }

  Color get getBorderColor {
    return cardBorderColor!;
  }

  void resetDateTime() {
    startTime = DateUtillities().getTimeFormat(0, 0);
    endTime = DateUtillities().getTimeFormat(0, 0);
    date = DateUtillities().getDateFormat(0, 0, 0);
    notifyListeners();
  }

  void setStartTime(String pickedStartTime) {
    startTime = pickedStartTime;
    notifyListeners();
  }

  void setEndTime(String pickedEndTime) {
    endTime = pickedEndTime;
    notifyListeners();
  }

  void setDate(String pickedDate) {
    date = pickedDate;
    notifyListeners();
  }

  void setColor({Color? cardBackgroundColor, cardTextTitleColor}) {
    cardColor = cardBackgroundColor;
    cardBorderColor = cardTextTitleColor;
    notifyListeners();
  }

  void addToTaskList(
      {required String startTime,
      required String taskTitle,
      required String endTime,
      required Color cardTextTitleColor,
      required cardColor,
      required String taskDescription}) {
    task.add(TaskCardModel(
        startTime: startTime,
        endTime: endTime,
        taskTitle: taskTitle,
        cardTextTitleColor: cardTextTitleColor,
        cardColor: cardColor,
        taskDescription: taskDescription));
    notifyListeners();
  }
}
