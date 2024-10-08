import 'package:dein_app/app/modules/home/views/message_view/message_home_view.dart';
import 'package:dein_app/app/modules/home/views/setting_view/setting_view.dart';
import 'package:dein_app/app/data/user_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/data_controller.dart';
import '../views/home_view/search_view.dart';

class HomeController extends GetxController {
  var navigationIndex = 0.obs;
  var pageController = PageController(initialPage: 0);
  var tabs = [const SearchView(), const MessageHomeView(), const SettingView()];
  var searchMode = 0.obs;
  var keyword = "".obs;
  var searchItems = <UserParser>[].obs;
  var touchedUser = 0.obs;

  var searchController = TextEditingController();



  @override
  void onInit() {
    super.onInit();
    navigationIndex.listen((p0) {
      pageController.animateToPage(p0,
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    });

    keyword.listen((p0) {
      searchItems.value = DataController.users
          .where((element) => element
              .toString()
              .toLowerCase()
              .contains(keyword.value.toLowerCase().replaceAll(" ", "_")))
          .toList();
    });
  }
}
