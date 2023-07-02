import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/data/document_parser.dart';
import 'package:dein_app/app/data/message_parser.dart';
import 'package:dein_app/app/data/user_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var pageController = PageController(initialPage: 0);
  var tabIndex = 0.obs;
  var user = UserParser();
  var messageController = ScrollController();

  void sendMessage(String val) {
    var context = DataController.messages.indexWhere((p0) =>
        (p0.date) == DateTime.now().toString().split(" ").first &&
        p0.user == user.id);
    if (context == -1) return;

    var messageGroup = DataController.messages[context];
    messageGroup.data!
        .add(Message(date: DateTime.now().toString(), message: val, user: 0));
    DataController.messages[context] = messageGroup;
    DataController.messages.refresh();
  }

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );
    if (result == null) return;

    DataController.userDocument
        .add(DocumentParser(user: user.id, document: result.files.single.path));
  }

  @override
  void onInit() {
    super.onInit();
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
    DataController.messages.listen((p0) {
      messageController
          .jumpTo(messageController.position.maxScrollExtent + 100);
    });
  }
}
