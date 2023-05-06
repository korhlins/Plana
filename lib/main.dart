import 'package:flutter/material.dart';
import 'package:plana/View-Model/task_card_data_provider.dart';
import 'package:provider/provider.dart';
import 'View/screen/home_screen.dart';
import 'package:plana/View/screen/Sign_up_screen.dart';
import 'package:plana/View/screen/sign_in_screen.dart';
import 'package:plana/View/screen/add_task_screen.dart';
import 'package:plana/View/screen/delete_task_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plana/View-Model/sign_in_provider.dart';
import 'package:plana/View-Model/page_view_management_provider.dart';
import 'package:plana/Services/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.db();
  await Firebase.initializeApp();
  runApp(Plana());
}

class Plana extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskCardDataProvider>(
            create: (BuildContext context) => TaskCardDataProvider()),
        ChangeNotifierProvider<PageViewManagementProvider>(
            create: (BuildContext context) => PageViewManagementProvider()),
        ChangeNotifierProvider<SignInAndOutProvider>(
            create: (BuildContext context) => SignInAndOutProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: user != null ? HomeScreen.id : SignInScreen.id,
        routes: {
          SignUpScreen.id: (context) => SignUpScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          AddTaskScreen.id: (context) => AddTaskScreen(),
          DeleteTaskScreen.id: (context) => DeleteTaskScreen(),
        },
      ),
    );
  }
}
