import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/components/small_card.dart';
import 'package:plana/View/components/set_dateTime_container.dart';
import 'package:plana/Model/Date_Utillities.dart';
import 'package:plana/View/components/large_button.dart';
import 'package:plana/View/screen/sign_in_screen.dart';

enum TaskNatureList { family, entertainment, study, work, personal, Class }

class AddTaskScreen extends StatefulWidget {
  static const String id = 'addTaskScreen';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TaskNatureList? taskNature;
  String startTime = DateUtillities().getTimeFormat(00, 00);
  String endTime = DateUtillities().getTimeFormat(00, 00);
  String selectedDate = DateUtillities().getDateFormat(0, 0, 0);

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
                      setState(
                        () {
                          taskNature = TaskNatureList.family;
                        },
                      );
                    },
                    textColor: const Color(0xFF61DDE2),
                    backgroundColor: const Color(0xFFDDF5F6),
                    borderColor: taskNature == TaskNatureList.family
                        ? const Color(0xFF61DDE2)
                        : const Color(0xFFDDF5F6),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SmallCard(
                    cardChild: 'Entertainment',
                    onTap: () {
                      setState(
                        () {
                          taskNature = TaskNatureList.entertainment;
                        },
                      );
                    },
                    textColor: const Color(0xFFFCA696),
                    backgroundColor: const Color(0xFFFAE3DD),
                    borderColor: taskNature == TaskNatureList.entertainment
                        ? const Color(0xFFFCA696)
                        : const Color(0xFFFAE3DD),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SmallCard(
                    cardChild: 'Study',
                    onTap: () {
                      setState(
                        () {
                          taskNature = TaskNatureList.study;
                        },
                      );
                    },
                    textColor: Colors.blueAccent,
                    backgroundColor: const Color(0xFFEAF2FF),
                    borderColor: taskNature == TaskNatureList.study
                        ? Colors.blueAccent
                        : const Color(0xFFEAF2FF),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SmallCard(
                    cardChild: 'Work',
                    onTap: () {
                      setState(
                        () {
                          taskNature = TaskNatureList.work;
                        },
                      );
                    },
                    textColor: const Color(0xFFFCA696),
                    backgroundColor: const Color(0xFFFAE3DD),
                    borderColor: taskNature == TaskNatureList.work
                        ? const Color(0xFFFCA696)
                        : const Color(0xFFFAE3DD),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SmallCard(
                    cardChild: 'Personal',
                    onTap: () {
                      setState(
                        () {
                          taskNature = TaskNatureList.personal;
                        },
                      );
                    },
                    textColor: Colors.blueAccent,
                    backgroundColor: const Color(0xFFEAF2FF),
                    borderColor: taskNature == TaskNatureList.personal
                        ? Colors.blueAccent
                        : const Color(0xFFEAF2FF),
                  ),
                  SizedBox(width: width * 0.02),
                  SmallCard(
                    cardChild: 'class',
                    onTap: () {
                      setState(
                        () {
                          taskNature = TaskNatureList.Class;
                        },
                      );
                    },
                    textColor: const Color(0xFF61DDE2),
                    backgroundColor: const Color(0xFFDDF5F6),
                    borderColor: taskNature == TaskNatureList.Class
                        ? const Color(0xFF61DDE2)
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
                      setState(() {
                        startTime = DateUtillities()
                            .getTimeFormat(date.hour, date.minute);
                      });
                    },
                    dateTime: startTime,
                  ),
                  SizedBox(
                    width: width * 0.08,
                  ),
                  SetDateTimeContainer(
                    label: 'End Time',
                    onConfirm: (date) {
                      setState(() {
                        endTime = DateUtillities()
                            .getTimeFormat(date.hour, date.minute);
                      });
                    },
                    dateTime: endTime,
                  ),
                ]),
                SizedBox(
                  height: height * 0.02,
                ),
                SetDateTimeContainer(
                    label: "Date",
                    onConfirm: (date) {
                      setState(() {
                        selectedDate = DateUtillities()
                            .getDateFormat(date.day, date.month, date.year);
                      });
                    },
                    dateTime: selectedDate),
                SizedBox(
                  height: height * 0.09,
                ),
                LargeButton(
                  inputText: '+ Add',
                  onPress: () {
                    print('im good over here');
                    Navigator.pushNamed(context, SignInScreen.id);
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
