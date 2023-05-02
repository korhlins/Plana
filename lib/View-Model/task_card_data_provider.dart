import 'package:flutter/material.dart';
import 'package:plana/Model/task_card_model.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:plana/View/utilities/Date_Utillities.dart';
import 'package:plana/Services/local_database.dart';

class TaskCardDataProvider extends ChangeNotifier {
  List<TaskCardModel> task = [];
  List<Map<String, dynamic>> cardDetails = DatabaseHelper.cardDetails;
  int indexOfUpdatedCard = 0;

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

  void addToTaskList() async {
    cardDetails = await DatabaseHelper.query();
    task.add(TaskCardModel(
        index: null,
        startTime: cardDetails[cardDetails.length]["startTime"],
        endTime: cardDetails[cardDetails.length]["endTime"],
        taskTitle: cardDetails[cardDetails.length]["taskTitle"],
        cardTextTitleColor: cardDetails[cardDetails.length]
            ["cardTextTitleColor"],
        cardColor: cardDetails[cardDetails.length]["cardColor"],
        taskDescription: cardDetails[cardDetails.length]["taskDescription"]));
    notifyListeners();
  }

  void updateCard() async {
    final updateCardDetails = await DatabaseHelper.getItem(HomeScreen.cardId!);
    TaskCardModel taskUpdate =
        task.firstWhere((element) => element.index == indexOfUpdatedCard);
    taskUpdate.startTime = updateCardDetails[indexOfUpdatedCard]["startTime"];
    taskUpdate.endTime = updateCardDetails[indexOfUpdatedCard]["endTime"];
    taskUpdate.taskTitle = updateCardDetails[indexOfUpdatedCard]["taskTitle"];
    taskUpdate.cardTextTitleColor =
        updateCardDetails[indexOfUpdatedCard]["cardTextTitleColor"];
    taskUpdate.cardColor = updateCardDetails[indexOfUpdatedCard]["cardColor"];
    taskUpdate.taskDescription =
        updateCardDetails[indexOfUpdatedCard]["taskDescription"];
    notifyListeners();
  }
}
