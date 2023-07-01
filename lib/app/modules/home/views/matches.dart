import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:dein_app/app/data_controller.dart';
import 'package:dein_app/app/modules/home/controllers/home_controller.dart';
import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';

class Matches extends GetView<HomeController> {
  const Matches({super.key});

  @override
  Widget build(BuildContext context) {
    var dataController = Get.put(DataController());
    var selectedUser = dataController.users
        .where((element) => element.id == controller.touchedUser.value)
        .first;
    var filteredUsers = dataController.users
        .where((element) => element.id != selectedUser.id)
        .toList();
    filteredUsers.insert(0, selectedUser);
    return Container(
      color: const Color(0xfff1f6fd),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.touchedUser(0);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      AssetsRes.BACK,
                      scale: 3.sp,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.sp),
                                  bottomRight: Radius.circular(15.sp),
                                ),
                              ),
                              width: 100.w,
                              child: Obx(() => Padding(
                                    padding: EdgeInsets.only(
                                        left: 5.w, top: 2.h, right: 2.w),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: GestureDetector(
                                              onTap: () => Get.back(),
                                              child: Icon(
                                                Icons.close,
                                                size: 25.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text(
                                            "What are you looking for?",
                                            style: TextStyle(
                                              color: const Color(0xFF292c57),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Container(
                                            width: 90.w,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      const Color(0xffeaeaea),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp)),
                                            child: DropdownButton<String>(
                                              elevation: 0,
                                              underline: Container(),
                                              items: dataController.filterTypes
                                                  .map((e) =>
                                                      DropdownMenuItem<String>(
                                                        value:
                                                            e["type"] as String,
                                                        child: Text(e["name"]
                                                            as String),
                                                      ))
                                                  .toList(),
                                              isExpanded: true,
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              value: dataController
                                                  .selectedFilterType.value,
                                              onChanged: (val) => dataController
                                                  .selectedFilterType(val),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 3.w),
                                            child: Obx(
                                              () {
                                                switch (dataController
                                                    .selectedFilterType.value) {
                                                  case "doctor":
                                                    return doctorFilter(
                                                        dataController);
                                                  case "software_developer":
                                                    return softwareDeveloperFilter(
                                                        dataController);

                                                  case "carpenter":
                                                    return carpenterFilter(
                                                        dataController);
                                                  default:
                                                    return const Placeholder();
                                                }
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 3.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: const Text(
                                                    "RESET",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9c9dac),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                  child: VerticalDivider(
                                                    color:
                                                        const Color(0xffeaeaea),
                                                    thickness: .5.w,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: const Text(
                                                    "APPLY",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff5666d8),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      useSafeArea: true,
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      AssetsRes.TOOLS,
                      scale: 3.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
            child: AppinioSwiper(
                controller: controller.swipeController,
                cardsCount: filteredUsers.length,
                loop: true,
                cardsBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Container(
                      height: 73.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage(filteredUsers[index].images!.first),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  filteredUsers[index].name!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.USER_DETAILS,
                                        arguments: filteredUsers[index].id!);
                                  },
                                  child: CircleAvatar(
                                    radius: 9.sp,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      "i",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12.sp),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Text(
                                  filteredUsers[index].location!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                Text(
                                  " • ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                Text(
                                  "${filteredUsers[index].age} years",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.swipeController.swipeLeft();
                                  },
                                  child: Image.asset(
                                    AssetsRes.CLOSE_CIRCLE,
                                    scale: 3.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.swipeController.swipeRight();
                                  },
                                  child: Image.asset(
                                    AssetsRes.HEART_CIRCLE,
                                    scale: 3.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}

Widget doctorFilter(DataController dataController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 3.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Experience",
            style: TextStyle(
              color: const Color(0xFF292c57),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${dataController.doctorExpSlider.value.toInt()}+ years",
            style: TextStyle(
              color: const Color(0xFF9c9dac),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 1.5.h,
      ),
      SliderTheme(
        data: SliderThemeData(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.sp),
        ),
        child: Slider(
          max: 20,
          thumbColor: Colors.white,
          inactiveColor: const Color(0xffeaeaea),
          min: 0,
          activeColor: const Color(0xff5666d8),
          value: dataController.doctorExpSlider.value,
          onChanged: (val) => dataController.doctorExpSlider(val),
        ),
      ),
      SizedBox(
        height: 1.5.h,
      ),
      Text(
        "Language",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: (dataController.filterTypes
                .where((element) =>
                    element["type"] == dataController.selectedFilterType.value)
                .first["language"]! as List<String>)
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: const Color(0xfff5f5f5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff9c9dac),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      SizedBox(
        height: 1.h,
      ),
    ],
  );
}

Widget softwareDeveloperFilter(DataController dataController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 1.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Workload",
            style: TextStyle(
              color: const Color(0xFF292c57),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${dataController.softWorkSlider.value.start.toInt()} - ${dataController.softWorkSlider.value.end.toInt()}%",
            style: TextStyle(
              color: const Color(0xFF9c9dac),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 1.h,
      ),
      SliderTheme(
        data: SliderThemeData(
          thumbColor: Colors.white,
          rangeThumbShape:
              RoundRangeSliderThumbShape(enabledThumbRadius: 12.sp),
          activeTrackColor: const Color(0xff5666d8),
        ),
        child: RangeSlider(
          max: 100,
          inactiveColor: const Color(0xffeaeaea),
          min: 0,
          onChanged: (val) => dataController.softWorkSlider(val),
          values: dataController.softWorkSlider.value,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(
        "Language",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: (dataController.filterTypes
                .where((element) =>
                    element["type"] == dataController.selectedFilterType.value)
                .first["language"]! as List<String>)
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: const Color(0xfff5f5f5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff9c9dac),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(
        "Employment type",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Container(
        width: 90.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffeaeaea),
            ),
            borderRadius: BorderRadius.circular(10.sp)),
        child: DropdownButton<String>(
          elevation: 0,
          underline: Container(),
          items: (dataController.filterTypes
                  .where((element) =>
                      element["type"] ==
                      dataController.selectedFilterType.value)
                  .first["employment_type"] as List<String>)
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          value: dataController.softEmpType.value,
          onChanged: (val) => dataController.softEmpType(val),
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(
        "Company size",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: (dataController.filterTypes
                .where((element) =>
                    element["type"] == dataController.selectedFilterType.value)
                .first["company_size"]! as List<String>)
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: const Color(0xfff5f5f5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff9c9dac),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(
        "Salary",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Row(
        children: [
          Expanded(
              child: DTextField(
            withShadow: false,
            withBorder: true,
            placeHolder: "Monthly (min)",
          )),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
              child: DTextField(
            withShadow: false,
            withBorder: true,
            placeHolder: "Yearly (min)",
          )),
        ],
      )
    ],
  );
}

Widget carpenterFilter(DataController dataController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 1.h,
      ),
      Text(
        "Branche",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Container(
        width: 90.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffeaeaea),
            ),
            borderRadius: BorderRadius.circular(10.sp)),
        child: DropdownButton<String>(
          elevation: 0,
          underline: Container(),
          items: (dataController.filterTypes
                  .where((element) =>
                      element["type"] ==
                      dataController.selectedFilterType.value)
                  .first["branch"] as List<String>)
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          value: dataController.carpenterBranch.value,
          onChanged: (val) => dataController.carpenterBranch(val),
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(
        "Canton",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Container(
        width: 90.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffeaeaea),
            ),
            borderRadius: BorderRadius.circular(10.sp)),
        child: DropdownButton<String>(
          elevation: 0,
          underline: Container(),
          items: (dataController.filterTypes
              .where((element) =>
          element["type"] ==
              dataController.selectedFilterType.value)
              .first["canton"] as List<String>)
              .map(
                (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
              .toList(),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          value: dataController.carpenterCanton.value,
          onChanged: (val) => dataController.carpenterCanton(val),
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(
        "Employment type",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Container(
        width: 90.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffeaeaea),
            ),
            borderRadius: BorderRadius.circular(10.sp)),
        child: DropdownButton<String>(
          elevation: 0,
          underline: Container(),
          items: (dataController.filterTypes
                  .where((element) =>
                      element["type"] ==
                      dataController.selectedFilterType.value)
                  .first["employment_type"] as List<String>)
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          value: dataController.softEmpType.value,
          onChanged: (val) => dataController.softEmpType(val),
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(
        "Language",
        style: TextStyle(
          color: const Color(0xFF292c57),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: (dataController.filterTypes
                .where((element) =>
                    element["type"] == dataController.selectedFilterType.value)
                .first["language"]! as List<String>)
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: const Color(0xfff5f5f5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff9c9dac),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}
