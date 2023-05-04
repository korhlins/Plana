import 'package:flutter/material.dart';
import 'package:plana/Model/task_card_model.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:plana/View/utilities/Date_Utillities.dart';
import '../Services/local_database.dart';

class TaskCardDataProvider extends ChangeNotifier {
  List<TaskCardModel> task = [];
  List<Map<String, dynamic>> cardDetails = [];
  int? indexOfUpdatedCard = HomeScreen.selectedIndex;

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
    // print(cardDetails.length);
    task.add(TaskCardModel(
        index: null,
        startTime: cardDetails[HomeScreen.addedCardIndex]["startTime"],
        endTime: cardDetails[HomeScreen.addedCardIndex]["endTime"],
        taskTitle: cardDetails[HomeScreen.addedCardIndex]["taskTitle"],
        cardTextTitleColor:
            Color(cardDetails[HomeScreen.addedCardIndex]["cardTextTitleColor"]),
        cardColor: Color(cardDetails[HomeScreen.addedCardIndex]["cardColor"]),
        taskDescription: cardDetails[HomeScreen.addedCardIndex]
            ["taskDescription"]));
    notifyListeners();
  }

  void updateCard() async {
    final updateCardDetails = await DatabaseHelper.getItem(HomeScreen.cardId);
    TaskCardModel taskUpdate =
        task.firstWhere((element) => element == indexOfUpdatedCard);
    taskUpdate.startTime = updateCardDetails[indexOfUpdatedCard!]["startTime"];
    taskUpdate.endTime = updateCardDetails[indexOfUpdatedCard!]["endTime"];
    taskUpdate.taskTitle = updateCardDetails[indexOfUpdatedCard!]["taskTitle"];
    taskUpdate.cardTextTitleColor =
        updateCardDetails[indexOfUpdatedCard!]["cardTextTitleColor"];
    taskUpdate.cardColor = updateCardDetails[indexOfUpdatedCard!]["cardColor"];
    taskUpdate.taskDescription =
        updateCardDetails[indexOfUpdatedCard!]["taskDescription"];
    print(cardDetails.length);
    notifyListeners();
  }
}
