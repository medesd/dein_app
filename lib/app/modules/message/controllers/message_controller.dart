import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/data/message_parser.dart';
import 'package:dein_app/app/data/user_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MessageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var pageController = PageController(initialPage: 0);
  var tabIndex = 0.obs;
  var user = UserParser();
  var dataController = Get.put(DataController());
  var messageController = ScrollController();

  void sendMessage(String val) {
    var context = dataController.messages.indexWhere((p0) =>
        (p0.date) == DateTime.now().toString().split(" ").first &&
        p0.user == user.id);
    if (context == -1) return;

    var messageGroup = dataController.messages[context];
    messageGroup.data!
        .add(Message(date: DateTime.now().toString(), message: val, user: 0));
    dataController.messages[context] = messageGroup;
    dataController.messages.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    var dataController = Get.put(DataController());
    user = Get.arguments;
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabIndex.listen((p0) {
      pageController.animateToPage(p0,
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    });
    pageController.addListener(() {
      tabController.animateTo(pageController.page?.toInt() ?? 0,
          curve: Curves.ease, duration: const Duration(milliseconds: 250));
    });
    dataController.messages.listen((p0) {
      messageController.jumpTo(messageController.position.maxScrollExtent+100);
    });
  }
}
