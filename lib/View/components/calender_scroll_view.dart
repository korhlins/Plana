import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../View-Model/page_view_management_provider.dart';
import '../utilities/Date_Utillities.dart';

class calenderScrollView extends StatelessWidget {
  const calenderScrollView({
    super.key,
    required this.width,
    required this.height,
    required this.daysInMonth,
  });

  final double width;
  final double height;
  final List<DateTime> daysInMonth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.1,
      child: ListView.builder(
          itemCount: daysInMonth.length,
          controller: ScrollController(
              initialScrollOffset:
                  context.watch<PageViewManagementProvider>().getSelectedDate *
                      0.09),
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context
                    .read<PageViewManagementProvider>()
                    .setSelectdDate(daysInMonth[index].day);
              },
              child: Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Container(
                  width: width * 0.09,
                  decoration: BoxDecoration(
                    color: context
                                .watch<PageViewManagementProvider>()
                                .getSelectedDate ==
                            daysInMonth[index].day
                        ? const Color(0xFFFF7247)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(width * 0.04),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFF2F6FF),
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
                            .getWeekdays()[daysInMonth[index].weekday - 1]
                            .substring(0, 2),
                        style: TextStyle(
                            color: context
                                        .watch<PageViewManagementProvider>()
                                        .getSelectedDate ==
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
    );
  }
}
