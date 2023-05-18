import 'package:flutter/material.dart';
import 'package:plana/View/components/set_dateTime_container.dart';
import 'package:provider/provider.dart';

import '../../View-Model/task_card_data_provider.dart';
import '../utilities/Date_Utillities.dart';

Row set_start_and_end_time_widget(BuildContext context, double width) {
  String startTime = '';
  String endTime = '';

  return Row(children: [
    SetDateTimeContainer(
      label: 'Start Time',
      onConfirm: (date) {
        startTime = DateUtillities().getTimeFormat(date.hour, date.minute);
        context.read<TaskCardDataProvider>().setStartTime(startTime);
      },
      dateTime: context.watch<TaskCardDataProvider>().getPickedStartTime,
    ),
    SizedBox(
      width: width * 0.08,
    ),
    SetDateTimeContainer(
      label: 'End Time',
      onConfirm: (date) {
        endTime = DateUtillities().getTimeFormat(date.hour, date.minute);
        context.read<TaskCardDataProvider>().setEndTime(endTime);
      },
      dateTime: context.watch<TaskCardDataProvider>().getPickedEndTime,
    ),
  ]);
}
