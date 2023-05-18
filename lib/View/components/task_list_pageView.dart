import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../View-Model/page_view_management_provider.dart';
import '../../View-Model/task_card_data_provider.dart';
import '../screen/add_task_screen.dart';
import '../utilities/enums.dart';
import 'package:plana/View/components/task_card.dart';
import 'package:plana/Services/local_database.dart';

class TaskListPageView extends StatelessWidget {
  TaskListPageView({required this.width, required this.pageController});

  double width;
  PageController pageController;
  static int? selectedCardId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            context
                .read<PageViewManagementProvider>()
                .setCurrentPageIndex(index);
            index == 0
                ? context
                    .read<PageViewManagementProvider>()
                    .setCurrentPageName(Views.todo)
                : index == 1
                    ? context
                        .read<PageViewManagementProvider>()
                        .setCurrentPageName(Views.inProgress)
                    : context
                        .read<PageViewManagementProvider>()
                        .setCurrentPageName(Views.done);
          },
          scrollDirection: Axis.horizontal,
          children: [
            ListView.builder(
              itemCount: context.watch<TaskCardDataProvider>().itemCount,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskTitle: context
                      .read<TaskCardDataProvider>()
                      .task[index]
                      .taskTitle,
                  taskDescription: context
                      .read<TaskCardDataProvider>()
                      .task[index]
                      .taskDescription,
                  cardColor: context
                      .read<TaskCardDataProvider>()
                      .task[index]
                      .cardColor,
                  cardTextTitleColor: context
                      .read<TaskCardDataProvider>()
                      .task[index]
                      .cardTextTitleColor,
                  startTime: context
                      .read<TaskCardDataProvider>()
                      .task[index]
                      .startTime,
                  endTime:
                      context.read<TaskCardDataProvider>().task[index].endTime,
                  updateFunction: () async {
                    var cardDetails = await DatabaseHelper.query();
                    selectedCardId = cardDetails[index]["id"];
                    Navigator.pushNamed(context, AddTaskScreen.id);
                  },
                );
              },
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (true) {
                  TaskCard(
                    taskTitle: context
                        .read<TaskCardDataProvider>()
                        .task[index]
                        .taskTitle,
                    taskDescription: context
                        .read<TaskCardDataProvider>()
                        .task[index]
                        .taskDescription,
                    cardColor: context
                        .read<TaskCardDataProvider>()
                        .task[index]
                        .cardColor,
                    cardTextTitleColor: context
                        .read<TaskCardDataProvider>()
                        .task[index]
                        .cardTextTitleColor,
                    startTime: context
                        .read<TaskCardDataProvider>()
                        .task[index]
                        .startTime,
                    endTime: context
                        .read<TaskCardDataProvider>()
                        .task[index]
                        .endTime,
                    updateFunction: () {},
                  );
                }
              },
            ),
            Text('data')
          ],
        ),
      ),
    );
  }
}
