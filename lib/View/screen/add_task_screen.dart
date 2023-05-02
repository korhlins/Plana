import 'package:flutter/material.dart';
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
  TaskNatureList? taskNature;
  TextEditingController titleTextController = TextEditingController();
  TextEditingController noteTextController = TextEditingController();
  Color? cardColor;
  String startTime = '';
  String endTime = '';
  String selectedDate = '';
  int? cardId = HomeScreen.cardId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (cardId != null) {
      final updatingItem = DatabaseHelper.cardDetails
          .firstWhere((element) => element["id"] == cardId);
      titleTextController.text = updatingItem["taskTitle"];
      noteTextController.text = updatingItem["taskDescription"];
    }
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).focusedChild?.unfocus();
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
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
                      taskNature = TaskNatureList.family;
                      context.read<TaskCardDataProvider>().setColor(
                          cardBackgroundColor: const Color(0xFFDDF5F6),
                          cardTextTitleColor: const Color(0xFF61DDE2));
                    },
                    textColor: const Color(0xFF61DDE2),
                    backgroundColor: const Color(0xFFDDF5F6),
                    borderColor: taskNature == TaskNatureList.family
                        ? context.watch<TaskCardDataProvider>().getBorderColor
                        : const Color(0xFFDDF5F6),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SmallCard(
                    cardChild: 'Entertainment',
                    onTap: () {
                      taskNature = TaskNatureList.entertainment;
                      context.read<TaskCardDataProvider>().setColor(
                          cardBackgroundColor: const Color(0xFFFAE3DD),
                          cardTextTitleColor: const Color(0xFFFCA696));
                    },
                    textColor: const Color(0xFFFCA696),
                    backgroundColor: const Color(0xFFFAE3DD),
                    borderColor: taskNature == TaskNatureList.entertainment
                        ? context.watch<TaskCardDataProvider>().getBorderColor
                        : const Color(0xFFFAE3DD),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SmallCard(
                    cardChild: 'Study',
                    onTap: () {
                      taskNature = TaskNatureList.study;
                      context.read<TaskCardDataProvider>().setColor(
                          cardBackgroundColor: const Color(0xFFEAF2FF),
                          cardTextTitleColor: Colors.blueAccent);
                    },
                    textColor: Colors.blueAccent,
                    backgroundColor: const Color(0xFFEAF2FF),
                    borderColor: taskNature == TaskNatureList.study
                        ? context.watch<TaskCardDataProvider>().getBorderColor
                        : const Color(0xFFEAF2FF),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SmallCard(
                    cardChild: 'Work',
                    onTap: () {
                      taskNature = TaskNatureList.work;
                      context.read<TaskCardDataProvider>().setColor(
                          cardBackgroundColor: const Color(0xFFFAE3DD),
                          cardTextTitleColor: const Color(0xFFFCA696));
                    },
                    textColor: const Color(0xFFFCA696),
                    backgroundColor: const Color(0xFFFAE3DD),
                    borderColor: taskNature == TaskNatureList.work
                        ? context.watch<TaskCardDataProvider>().getBorderColor
                        : const Color(0xFFFAE3DD),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SmallCard(
                    cardChild: 'Personal',
                    onTap: () {
                      taskNature = TaskNatureList.personal;
                      context.read<TaskCardDataProvider>().setColor(
                          cardBackgroundColor: const Color(0xFFEAF2FF),
                          cardTextTitleColor: Colors.blueAccent);
                    },
                    textColor: Colors.blueAccent,
                    backgroundColor: const Color(0xFFEAF2FF),
                    borderColor: taskNature == TaskNatureList.personal
                        ? context.watch<TaskCardDataProvider>().getBorderColor
                        : const Color(0xFFEAF2FF),
                  ),
                  SizedBox(width: width * 0.02),
                  SmallCard(
                    cardChild: 'class',
                    onTap: () {
                      taskNature = TaskNatureList.Class;
                      context.read<TaskCardDataProvider>().setColor(
                          cardBackgroundColor: const Color(0xFFDDF5F6),
                          cardTextTitleColor: const Color(0xFF61DDE2));
                    },
                    textColor: const Color(0xFF61DDE2),
                    backgroundColor: const Color(0xFFDDF5F6),
                    borderColor: taskNature == TaskNatureList.Class
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
                      context.read<TaskCardDataProvider>().setEndTime(endTime);
                    },
                    dateTime:
                        context.watch<TaskCardDataProvider>().getPickedEndTime,
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
                  onPress: () {
                    if (cardId == null) {
                      DatabaseHelper.insert(
                          taskTitle: titleTextController.text,
                          taskDescription: noteTextController.text,
                          startTime: startTime,
                          endTime: endTime,
                          cardTextTitleColor: context
                              .read<TaskCardDataProvider>()
                              .getBorderColor,
                          cardColor:
                              context.read<TaskCardDataProvider>().cardColor);
                      HomeScreen.refreshTasks();
                      context.read<TaskCardDataProvider>().resetDateTime();
                      Navigator.pushNamed(context, HomeScreen.id);
                    }
                    DatabaseHelper.update(
                        cardId!,
                        titleTextController.text,
                        noteTextController.text,
                        startTime,
                        endTime,
                        context.read<TaskCardDataProvider>().getBorderColor,
                        context.read<TaskCardDataProvider>().cardColor!);
                    HomeScreen.refreshTasks();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
