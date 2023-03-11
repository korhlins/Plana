import 'package:flutter/material.dart';
import 'package:plana/View/screen/add_task_screen.dart';
import 'package:plana/View/components/small_card.dart';
import 'package:plana/View/screen/delete_task_screen.dart';
import 'package:plana/View/screen/sign_in_screen.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/utilities/Date_Utillities.dart';
import 'package:date_utils/date_utils.dart' as Date_Utils;
import 'package:plana/View/components/task_card.dart';
import 'package:provider/provider.dart';
import 'package:plana/View-Model/task_card_data_provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

enum Views { todo, inProgress, done }

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todoList = [];
  final iconList = <IconData>[Icons.view_cozy, Icons.delete_rounded];
  int currentPage = 0;
  int selectedIndex = 0;
  Views isTapped = Views.todo;
  int selectedDate = DateTime.now().day;
  late List<DateTime> daysInMonth;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    daysInMonth = Date_Utils.DateUtils.daysInRange(DateTime.now(),
            Date_Utils.DateUtils.daysInMonth(DateTime.now()).last)
        .toList();
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
                                    "Asala Collins",
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
                    SizedBox(
                      width: width,
                      height: height * 0.1,
                      child: ListView.builder(
                          itemCount: daysInMonth.length,
                          controller: ScrollController(
                              initialScrollOffset:
                                  selectedDate.toDouble() * 0.09),
                          scrollDirection: Axis.horizontal,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = daysInMonth[index].day;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.all(width * 0.02),
                                child: Container(
                                  width: width * 0.09,
                                  decoration: BoxDecoration(
                                    color:
                                        selectedDate == daysInMonth[index].day
                                            ? const Color(0xFFFF7247)
                                            : Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(width * 0.04),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            const Color(0xFFF2F6FF),
                                        radius: width * 0.033,
                                        child: Text(
                                          daysInMonth[index].day.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: height * 0.016,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        DateUtillities()
                                            .getWeekdays()[
                                                daysInMonth[index].weekday - 1]
                                            .substring(0, 2),
                                        style: TextStyle(
                                            color: selectedDate ==
                                                    daysInMonth[index].day
                                                ? Colors.white
                                                : const Color(0xFF8A8A88),
                                            fontSize: height * 0.015,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SmallCard(
                                  textColor: isTapped == Views.todo
                                      ? const Color(0xFFEAF2FF)
                                      : Colors.blueAccent,
                                  backgroundColor: isTapped == Views.todo
                                      ? Colors.blueAccent
                                      : const Color(0xFFEAF2FF),
                                  cardChild: "To do",
                                  onTap: () {
                                    setState(
                                      () {
                                        isTapped = Views.todo;
                                      },
                                    );
                                    pageController.animateToPage(
                                        pageController.initialPage,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.bounceInOut);
                                  },
                                  borderColor: isTapped == Views.todo
                                      ? Colors.blueAccent
                                      : const Color(0xFFEAF2FF),
                                ),
                                SizedBox(width: width * 0.015),
                                SmallCard(
                                  textColor: isTapped == Views.inProgress
                                      ? const Color(0xFFEAF2FF)
                                      : Colors.blueAccent,
                                  backgroundColor: isTapped == Views.inProgress
                                      ? Colors.blueAccent
                                      : const Color(0xFFEAF2FF),
                                  cardChild: "In Progress",
                                  onTap: () {
                                    setState(() {
                                      isTapped = Views.inProgress;
                                    });
                                    pageController.animateToPage(1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.bounceInOut);
                                  },
                                  borderColor: isTapped == Views.inProgress
                                      ? Colors.blueAccent
                                      : const Color(0xFFEAF2FF),
                                ),
                                SizedBox(width: width * 0.015),
                                SmallCard(
                                  textColor: isTapped == Views.done
                                      ? const Color(0xFFEAF2FF)
                                      : Colors.blueAccent,
                                  backgroundColor: isTapped == Views.done
                                      ? Colors.blueAccent
                                      : const Color(0xFFEAF2FF),
                                  cardChild: "Done",
                                  onTap: () {
                                    setState(() {
                                      isTapped = Views.done;
                                    });
                                    pageController.animateToPage(2,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.bounceInOut);
                                  },
                                  borderColor: isTapped == Views.done
                                      ? Colors.blueAccent
                                      : const Color(0xFFEAF2FF),
                                )
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.settings,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        currentPage = index;
                        setState(() {
                          if (index == 0) {
                            isTapped = Views.todo;
                          } else if (index == 1) {
                            isTapped = Views.inProgress;
                          } else {
                            isTapped = Views.done;
                          }
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      children: [
                        ListView.builder(
                          itemCount:
                              context.read<TaskCardDataProvider>().itemCount,
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
                              startTime: context
                                  .read<TaskCardDataProvider>()
                                  .task[index]
                                  .startTime,
                              endTime: context
                                  .read<TaskCardDataProvider>()
                                  .task[index]
                                  .endTime,
                            );
                          },
                        ),
                        Text('data'),
                        Text('data')
                      ],
                    ),
                  ),
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
                    activeIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
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
