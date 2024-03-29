import 'package:flutter/cupertino.dart';
import 'package:plana/View/utilities/enums.dart';

class PageViewManagementProvider extends ChangeNotifier {
  int currentPageIndex = 0;
  Views currentPage = Views.todo;
  int selectedDate = DateTime.now().day;
  int selectedIndex = 0;

  int get getSelectedDate {
    return selectedDate;
  }

  int get getCurrentPageIndex {
    return currentPageIndex;
  }

  Views get getCurrentPageName {
    return currentPage;
  }

  int get getSelectedIndex {
    return selectedIndex;
  }

  void setSelectdDate(int date) {
    selectedDate = date;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void setCurrentPageIndex(int pageIndex) {
    currentPageIndex = pageIndex;
    notifyListeners();
  }

  void setCurrentPageName(Views pageName) {
    currentPage = pageName;
    notifyListeners();
  }
}
