import 'package:flutter/material.dart';

class showSnackBar {
  showSnackBar();

  static SnackBar snackBar(String? snackBarMessage) {
    return SnackBar(
      content: Text(snackBarMessage!),
      backgroundColor: Colors.red,
    );
  }
}
