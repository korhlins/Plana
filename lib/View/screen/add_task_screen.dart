import 'package:flutter/material.dart';
import 'package:plana/Model/task_card_model.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/components/small_card.dart';
import 'package:plana/View/components/set_dateTime_container.dart';
import 'package:plana/View/utilities/Date_Utillities.dart';
import 'package:plana/View/components/large_button.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:plana/View-Model/task_card_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:plana/Services/local_database.dart';

enum TaskNatureList { family, entertainment, study, work, personal, Class }

class AddTaskScreen extends StatefulWidget {
  static const String id = 'addTaskScreen';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? taskNature;
  TextEditingController titleTextController = TextEditingController();
  TextEditingController noteTextController = TextEditingController();
  String startTime = '';
  String endTime = '';
  String selectedDate = '';
  int? cardId;
  List<Map<String, dynamic>> cardDetails = [];

  void getData() async {
    if (cardId != null) {
      try {
        final updatingItem = await DatabaseHelper.getItem(cardId);
        titleTextController.text = updatingItem[0]["taskTitle"];
        noteTextController.text = updatingItem[0]["taskDescription"];
        taskNature = updatingItem[0]["taskNature"];
        context
            .read<TaskCardDataProvider>()
            .setCardBorderColor(updatingItem[0]["cardTextTitleColor"]);
        context
            .read<TaskCardDataProvider>()
            .setStartTime(updatingItem[0]["startTime"]);
        context
            .read<TaskCardDataProvider>()
            .setEndTime(updatingItem[0]["endTime"]);
        context
            .read<TaskCardDataProvider>()
            .setDate(updatingItem[0]["selectedDate"]);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardId = HomeScreen.cardId;
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleTextController.dispose();
    noteTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();
    double width = ScreenDimension(context: context).getWidth();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).focusedChild?.unfocus();
              // Navigator.pop(context);
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Create new task',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    'Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextField(
                    controller: titleTextController,
                    enableSuggestions: true,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF2F6FF),
                      hintText: 'Add your title',
                      hintStyle: const TextStyle(
                        color: Colors.black12,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(height * 0.05),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(height * 0.05),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Note',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextField(
                    maxLines: 4,
                    maxLength: 250,
                    controller: noteTextController,
                    enableSuggestions: true,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF2F6FF),
                      hintText: 'Add your note',
                      hintStyle: const TextStyle(
                        color: Colors.black12,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(height * 0.05),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(height * 0.05),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Wrap(direction: Axis.horizontal, children: [
                    SmallCard(
                      cardChild: 'Family',
                      onTap: () {
                        taskNature = TaskNatureList.family.name;
                        context.read<TaskCardDataProvider>().setColor(
                            cardBackgroundColor: const Color(0xFFDDF5F6),
                            cardTextTitleColor: const Color(0xFF61DDE2));
                      },
                      textColor: const Color(0xFF61DDE2),
                      backgroundColor: const Color(0xFFDDF5F6),
                      borderColor: taskNature == TaskNatureList.family.name
                          ? context.watch<TaskCardDataProvider>().getBorderColor
                          : const Color(0xFFDDF5F6),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    SmallCard(
                      cardChild: 'Entertainment',
                      onTap: () {
                        taskNature = TaskNatureList.entertainment.name;
                        context.read<TaskCardDataProvider>().setColor(
                            cardBackgroundColor: const Color(0xFFFAE3DD),
                            cardTextTitleColor: const Color(0xFFFCA696));
                      },
                      textColor: const Color(0xFFFCA696),
                      backgroundColor: const Color(0xFFFAE3DD),
                      borderColor: taskNature ==
                              TaskNatureList.entertainment.name
                          ? context.watch<TaskCardDataProvider>().getBorderColor
                          : const Color(0xFFFAE3DD),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    SmallCard(
                      cardChild: 'Study',
                      onTap: () {
                        taskNature = TaskNatureList.study.name;
                        context.read<TaskCardDataProvider>().setColor(
                            cardBackgroundColor: const Color(0xFFEAF2FF),
                            cardTextTitleColor: Colors.blueAccent);
                      },
                      textColor: Colors.blueAccent,
                      backgroundColor: const Color(0xFFEAF2FF),
                      borderColor: taskNature == TaskNatureList.study.name
                          ? context.watch<TaskCardDataProvider>().getBorderColor
                          : const Color(0xFFEAF2FF),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    SmallCard(
                      cardChild: 'Work',
                      onTap: () {
                        taskNature = TaskNatureList.work.name;
                        context.read<TaskCardDataProvider>().setColor(
                            cardBackgroundColor: const Color(0xFFFAE3DD),
                            cardTextTitleColor: const Color(0xFFFCA696));
                      },
                      textColor: const Color(0xFFFCA696),
                      backgroundColor: const Color(0xFFFAE3DD),
                      borderColor: taskNature == TaskNatureList.work.name
                          ? context.watch<TaskCardDataProvider>().getBorderColor
                          : const Color(0xFFFAE3DD),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    SmallCard(
                      cardChild: 'Personal',
                      onTap: () {
                        taskNature = TaskNatureList.personal.name;
                        context.read<TaskCardDataProvider>().setColor(
                            cardBackgroundColor: const Color(0xFFEAF2FF),
                            cardTextTitleColor: Colors.blueAccent);
                      },
                      textColor: Colors.blueAccent,
                      backgroundColor: const Color(0xFFEAF2FF),
                      borderColor: taskNature == TaskNatureList.personal.name
                          ? context.watch<TaskCardDataProvider>().getBorderColor
                          : const Color(0xFFEAF2FF),
                    ),
                    SizedBox(width: width * 0.02),
                    SmallCard(
                      cardChild: 'class',
                      onTap: () {
                        taskNature = TaskNatureList.Class.name;
                        context.read<TaskCardDataProvider>().setColor(
                            cardBackgroundColor: const Color(0xFFDDF5F6),
                            cardTextTitleColor: const Color(0xFF61DDE2));
                      },
                      textColor: const Color(0xFF61DDE2),
                      backgroundColor: const Color(0xFFDDF5F6),
                      borderColor: taskNature == TaskNatureList.Class.name
                          ? context.watch<TaskCardDataProvider>().getBorderColor
                          : const Color(0xFFDDF5F6),
                    ),
                  ]),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(children: [
                    SetDateTimeContainer(
                      label: 'Start Time',
                      onConfirm: (date) {
                        startTime = DateUtillities()
                            .getTimeFormat(date.hour, date.minute);
                        context
                            .read<TaskCardDataProvider>()
                            .setStartTime(startTime);
                      },
                      dateTime: context
                          .watch<TaskCardDataProvider>()
                          .getPickedStartTime,
                    ),
                    SizedBox(
                      width: width * 0.08,
                    ),
                    SetDateTimeContainer(
                      label: 'End Time',
                      onConfirm: (date) {
                        endTime = DateUtillities()
                            .getTimeFormat(date.hour, date.minute);
                        context
                            .read<TaskCardDataProvider>()
                            .setEndTime(endTime);
                      },
                      dateTime: context
                          .watch<TaskCardDataProvider>()
                          .getPickedEndTime,
                    ),
                  ]),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SetDateTimeContainer(
                      label: "Date",
                      onConfirm: (date) {
                        selectedDate = DateUtillities()
                            .getDateFormat(date.day, date.month, date.year);
                        context
                            .read<TaskCardDataProvider>()
                            .setDate(selectedDate);
                      },
                      dateTime:
                          context.watch<TaskCardDataProvider>().getPickedDate),
                  SizedBox(
                    height: height * 0.09,
                  ),
                  LargeButton(
                    inputText: cardId == null ? "+ Add" : "Update",
                    onPress: () async {
                      context.read<TaskCardDataProvider>().setCardId();
                      if (cardId == null) {
                        DatabaseHelper.insert(TaskCardModel(
                            id: context.read<TaskCardDataProvider>().getCardId,
                            startTime: startTime,
                            endTime: endTime,
                            taskTitle: titleTextController.text,
                            cardTextTitleColor: context
                                .read<TaskCardDataProvider>()
                                .getBorderColor,
                            cardColor:
                                context.read<TaskCardDataProvider>().cardColor!,
                            taskDescription: noteTextController.text,
                            date: selectedDate,
                            taskNature: taskNature));
                        context.read<TaskCardDataProvider>().resetDateTime();
                        context.read<TaskCardDataProvider>().addToTaskList();
                        Navigator.pushNamed(context, HomeScreen.id);
                      } else {
                        DatabaseHelper.update(TaskCardModel(
                            id: cardId!,
                            startTime: context
                                .read<TaskCardDataProvider>()
                                .getPickedStartTime,
                            endTime: context
                                .read<TaskCardDataProvider>()
                                .getPickedEndTime,
                            taskTitle: titleTextController.text,
                            taskDescription: noteTextController.text,
                            cardTextTitleColor: context
                                .read<TaskCardDataProvider>()
                                .getBorderColor,
                            cardColor:
                                context.read<TaskCardDataProvider>().cardColor!,
                            date: context
                                .read<TaskCardDataProvider>()
                                .getPickedDate,
                            taskNature: taskNature));
                        print(context
                            .read<TaskCardDataProvider>()
                            .getBorderColor);
                        context.read<TaskCardDataProvider>().resetDateTime();
                        Navigator.pushNamed(context, HomeScreen.id);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
