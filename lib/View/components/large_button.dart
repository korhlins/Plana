import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/screen/home_screen.dart';

class LargeButton extends StatelessWidget {
  String inputText;
  Function() onPress;

  LargeButton({required this.inputText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();
    double width = ScreenDimension(context: context).getWidth();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height * 0.1),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height * 0.07)),
      ),
      onPressed: () {
        onPress;
        FocusScope.of(context).focusedChild?.unfocus();
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      },
      child: Text(
        inputText,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: height * 0.025),
      ),
    );
  }
}
