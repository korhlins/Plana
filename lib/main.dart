import 'package:flutter/material.dart';
import 'View/screen/home_screen.dart';
import 'package:plana/View/screen/Sign_up_screen.dart';
import 'package:plana/View/screen/sign_in_screen.dart';
import 'package:plana/View/screen/add_task_screen.dart';
import 'package:plana/View/screen/delete_task_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Plana());
}

class Plana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        SignUpScreen.id: (context) => SignUpScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AddTaskScreen.id: (context) => AddTaskScreen(),
        DeleteTaskScreen.id: (context) => DeleteTaskScreen(),
      },
    );
  }
}
