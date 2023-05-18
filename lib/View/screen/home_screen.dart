import 'package:flutter/material.dart';
import 'package:plana/View/screen/add_task_screen.dart';
import 'package:plana/View/screen/delete_task_screen.dart';
import 'package:plana/View/screen/sign_in_screen.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/utilities/Date_Utillities.dart';
import 'package:date_utils/date_utils.dart' as Date_Utils;
import 'package:provider/provider.dart';
import 'package:plana/View-Model/sign_in_provider.dart';
import 'package:plana/View-Model/task_card_data_provider.dart';
import 'package:plana/View-Model/page_view_management_provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../components/calender_scroll_view.dart';
import '../components/task_life_cycle_widget.dart';
import '../components/task_list_pageView.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  static int? cardId;
  static int? selectedIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todoList = [];
  final iconList = <IconData>[Icons.view_cozy, Icons.delete_rounded];
  int currentPage = 0;

  late List<DateTime> daysInMonth;
  List<Map<String, dynamic>> cardDetails = [];
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    daysInMonth = Date_Utils.DateUtils.daysInRange(DateTime.now(),
            Date_Utils.DateUtils.daysInMonth(DateTime.now()).last)
        .toList();
    context.read<TaskCardDataProvider>().refreshTasks();
    HomeScreen.cardId = null;
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();
    double width = ScreenDimension(context: context).getWidth();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, SignInScreen.id);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      // foregroundColor: Colors.black,
                                      child: Image.asset(
                                          "images/account_icon.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                  Text(
                                    context
                                        .read<SignInAndOutProvider>()
                                        .getUserName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.05,
                                    ),
                                  )
                                ],
                              ),
                              const Icon(Icons.add_alert_outlined)
                            ],
                          ),
                          SizedBox(height: height * 0.03),
                          Text(
                            "Today",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${DateUtillities().getWeekdays()[DateTime.now().weekday - 1]}, ${DateTime.now().day.toString()} ${DateUtillities().getMonths()[DateTime.now().month - 1]} ${DateTime.now().year.toString()}",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    calenderScrollView(
                        width: width, height: height, daysInMonth: daysInMonth),
                    taskLifeCycle(width: width, pageController: pageController),
                  ],
                ),
                TaskListPageView(
                  width: width,
                  pageController: pageController,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: height * 0.1,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  bottomNavigationBar: AnimatedBottomNavigationBar(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white70,
                    height: height * 0.1,
                    icons: iconList,
                    activeIndex: context
                        .read<PageViewManagementProvider>()
                        .getSelectedIndex,
                    onTap: (index) {
                      context
                          .read<PageViewManagementProvider>()
                          .setCurrentPageIndex(index);
                      index == 1
                          ? Navigator.pushNamed(context, DeleteTaskScreen.id)
                          : Navigator.pushNamed(context, HomeScreen.id);
                    },
                    backgroundColor: const Color(0xFFFF7247),
                    gapLocation: GapLocation.center,
                    notchSmoothness: NotchSmoothness.defaultEdge,
                    leftCornerRadius: height * 0.04,
                    rightCornerRadius: height * 0.04,
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddTaskScreen.id);
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
