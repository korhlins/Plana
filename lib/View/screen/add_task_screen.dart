import 'package:flutter/material.dart';
import 'package:plana/Model/task_card_model.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/components/set_dateTime_container.dart';
import 'package:plana/View/utilities/Date_Utillities.dart';
import 'package:plana/View/components/large_button.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:plana/View-Model/task_card_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:plana/Services/local_database.dart';
import '../components/add_task_textfields.dart';
import '../components/set_time_widget.dart';
import '../components/task_list_pageView.dart';
import '../components/task_nature_buttons.dart';

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
        titleTextController = updatingItem[0]["taskTitle"];
        noteTextController = updatingItem[0]["taskDescription"];
        taskNature = updatingItem[0]["taskNature"];

        context.read<TaskCardDataProvider>().setColor(
            cardBackgroundColor: Color(updatingItem[0]["cardColor"]),
            cardTextTitleColor: Color(updatingItem[0]["cardTextTitleColor"]));

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
    cardId = TaskListPageView.selectedCardId;
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
                  AddTaskTextFields(
                    height: height,
                    noteTextController: noteTextController,
                    titleTextController: titleTextController,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TaskNatureButtons(width: width, taskNature: taskNature),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SetStartAndEndTimeWidget(width: width),
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
