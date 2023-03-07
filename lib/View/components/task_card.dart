import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();
    double width = ScreenDimension(context: context).getWidth();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("SelectedTime"),
        SizedBox(width: width * 0.01),
        Container(
          padding: EdgeInsets.symmetric(vertical: height * 0.015),
          margin: EdgeInsets.all(height * 0.008),
          width: width * 0.62,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(height * 0.03),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.003, horizontal: width * 0.035),
                child: Text("SelectedTasks"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.003, horizontal: width * 0.035),
                child: Text("SelectedTasks"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.003, horizontal: width * 0.035),
                child: Text("SelectedTasks"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
