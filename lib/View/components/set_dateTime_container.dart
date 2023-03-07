import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_utils/date_utils.dart' as Date_Utils;

class SetDateTimeContainer extends StatelessWidget {
  SetDateTimeContainer(
      {required this.label, required this.onConfirm, required this.dateTime});

  String label;
  Function(DateTime)? onConfirm;
  String dateTime;

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();
    double width = ScreenDimension(context: context).getWidth();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: height * 0.02),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        GestureDetector(
          onTap: () {
            DatePicker.showDateTimePicker(
              context,
              showTitleActions: true,
              minTime: DateTime.now(),
              maxTime: DateTime(
                DateTime.now().year,
                DateTime.december,
              ),
              onConfirm: onConfirm,
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.009, horizontal: width * 0.03),
            decoration: BoxDecoration(
                color: Color(0xFFF2F6FF),
                borderRadius: BorderRadius.circular(height * 0.05)),
            height: height * 0.07,
            child: Center(
              child: Text(
                dateTime,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
