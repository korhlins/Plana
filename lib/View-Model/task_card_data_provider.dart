import 'package:flutter/material.dart';
import 'package:plana/Model/task_card_model.dart';
import 'package:plana/View/utilities/Date_Utillities.dart';
import '../Services/local_database.dart';

class TaskCardDataProvider extends ChangeNotifier {
  List<TaskCardModel> task = [];
  List<Map<String, dynamic>> cardDetails = [];
  int cardId = 0;

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

  int get getCardId {
    return cardId;
  }

  void setCardId() {
    cardId += 1;
    notifyListeners();
  }

  void refreshTasks() async {
    cardDetails = await DatabaseHelper.query();
    task = List.generate(
        cardDetails.length,
        (index) => TaskCardModel(
            id: cardDetails[index]["id"],
            startTime: cardDetails[index]["startTime"],
            endTime: cardDetails[index]["endTime"],
            date: cardDetails[index]["date"],
            taskTitle: cardDetails[index]["taskTitle"],
            cardTextTitleColor: Color(cardDetails[index]["cardTextTitleColor"]),
            cardColor: Color(cardDetails[index]["cardColor"]),
            taskDescription: cardDetails[index]["taskDescription"]));
    notifyListeners();
  }

  void resetDateTime() {
    startTime = DateUtillities().getTimeFormat(0, 0);
    endTime = DateUtillities().getTimeFormat(0, 0);
    date = DateUtillities().getDateFormat(0, 0, 0);
    notifyListeners();
  }

  void setCardBorderColor(Color cardBorderOutlineColor) {
    cardBorderColor = cardBorderOutlineColor;
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
    task = List.generate(
        cardDetails.length,
        (index) => TaskCardModel(
            id: cardDetails[index]["id"],
            startTime: cardDetails[index]["startTime"],
            endTime: cardDetails[index]["endTime"],
            date: cardDetails[index]["date"],
            taskTitle: cardDetails[index]["taskTitle"],
            cardTextTitleColor: Color(cardDetails[index]["cardTextTitleColor"]),
            cardColor: Color(cardDetails[index]["cardColor"]),
            taskDescription: cardDetails[index]["taskDescription"]));
    print(task.length);
    notifyListeners();
  }
}
