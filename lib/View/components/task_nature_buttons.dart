import 'package:flutter/material.dart';
import 'package:plana/View/components/small_card.dart';
import 'package:provider/provider.dart';
import 'package:plana/View-Model/task_card_data_provider.dart';
import '../utilities/enums.dart';

class TaskNatureButtons extends StatelessWidget {
  TaskNatureButtons({required this.width, required this.taskNature});
  double width;
  String? taskNature;

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal, children: [
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
        borderColor: taskNature == TaskNatureList.entertainment.name
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
    ]);
  }
}
