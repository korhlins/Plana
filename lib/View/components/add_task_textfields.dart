import 'package:flutter/material.dart';

class AddTaskTextFields extends StatelessWidget {
  AddTaskTextFields(
      {required this.height,
      required this.titleTextController,
      required this.noteTextController});

  double height;
  TextEditingController titleTextController;
  TextEditingController noteTextController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      )
    ]);
  }
}
