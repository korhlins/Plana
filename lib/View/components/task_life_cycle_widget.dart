import 'package:flutter/material.dart';
import 'package:plana/View/components/small_card.dart';
import 'package:provider/provider.dart';

import '../../View-Model/page_view_management_provider.dart';
import '../utilities/enums.dart';

class taskLifeCycle extends StatelessWidget {
  const taskLifeCycle({
    super.key,
    required this.width,
    required this.pageController,
  });

  final double width;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                SmallCard(
                  textColor: context
                              .watch<PageViewManagementProvider>()
                              .getCurrentPageName ==
                          Views.todo
                      ? const Color(0xFFEAF2FF)
                      : Colors.blueAccent,
                  backgroundColor: context
                              .watch<PageViewManagementProvider>()
                              .getCurrentPageName ==
                          Views.todo
                      ? Colors.blueAccent
                      : const Color(0xFFEAF2FF),
                  cardChild: "To do",
                  onTap: () {
                    context
                        .read<PageViewManagementProvider>()
                        .setCurrentPageName(Views.todo);
                    pageController.animateToPage(pageController.initialPage,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceInOut);
                  },
                  borderColor: Colors.transparent,
                ),
                SizedBox(width: width * 0.015),
                SmallCard(
                  textColor: context
                              .watch<PageViewManagementProvider>()
                              .getCurrentPageName ==
                          Views.inProgress
                      ? const Color(0xFFEAF2FF)
                      : Colors.blueAccent,
                  backgroundColor: context
                              .watch<PageViewManagementProvider>()
                              .getCurrentPageName ==
                          Views.inProgress
                      ? Colors.blueAccent
                      : const Color(0xFFEAF2FF),
                  cardChild: "In Progress",
                  onTap: () {
                    context
                        .read<PageViewManagementProvider>()
                        .setCurrentPageName(Views.inProgress);
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceInOut);
                  },
                  borderColor: Colors.transparent,
                ),
                SizedBox(width: width * 0.015),
                SmallCard(
                  textColor: context
                              .watch<PageViewManagementProvider>()
                              .getCurrentPageName ==
                          Views.done
                      ? const Color(0xFFEAF2FF)
                      : Colors.blueAccent,
                  backgroundColor: context
                              .watch<PageViewManagementProvider>()
                              .getCurrentPageName ==
                          Views.done
                      ? Colors.blueAccent
                      : const Color(0xFFEAF2FF),
                  cardChild: "Done",
                  onTap: () {
                    context
                        .read<PageViewManagementProvider>()
                        .setCurrentPageName(Views.done);
                    pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceInOut);
                  },
                  borderColor: Colors.transparent,
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
    );
  }
}
