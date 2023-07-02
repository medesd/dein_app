import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/d_textfield.dart';
import '../../setup_profile/views/empty_photo_card.dart';
import '../../setup_profile/views/photo_card.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Edit profile",
          style: TextStyle(color: Color(0xff292c57)),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Image.asset(
            AssetsRes.BACK,
            scale: 3.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.h,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Signed in as ${DataController.name}.",
                      style: TextStyle(
                          color: const Color(0xff292c57), fontSize: 15.sp),
                    ),
                    Text(
                      "Sign out",
                      style: TextStyle(
                          color: const Color(0xff5666d8), fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Image.asset(
                    AssetsRes.SWISS_ID,
                    color: Color(0xff9c9dac),
                    scale: 3.sp,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    "SwissID profile",
                    style: TextStyle(color: Color(0xff646681), fontSize: 13.sp),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 3.h,
              ),
              Obx(
                () => Row(
                  children: [
                    if (DataController.avatar.isEmpty)
                      GestureDetector(onTap: (){
                        controller.profileController.pickSelfie();
                      },child: const EmptyPhotoCard())
                    else
                      PhotoCard(image: DataController.avatar.value),
                    SizedBox(
                      width: 1.w,
                    ),
                    const EmptyPhotoCard(),
                    SizedBox(
                      width: 1.w,
                    ),
                    const EmptyPhotoCard(),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "About me",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF292c57),
                    fontSize: 13.sp),
              ),
              SizedBox(height: 2.h),
              Obx(() => DTextField(
                    area: true,
                    withBorder: true,
                    defaultValue: DataController.userAbout.value,
                    placeHolder: "About me",
                    onChanged: (val) => DataController.userAbout(val),
                  )),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mobile number",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF292c57),
                        fontSize: 13.sp),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AssetsRes.SUCCESS,
                        scale: 1.sp,
                        color: const Color(0xff9c9dac),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "Verified",
                        style: TextStyle(
                            color: const Color(0xFF9c9dac), fontSize: 13.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => DTextField(
                  withShadow: false,
                  withBorder: true,
                  defaultValue: DataController.userPhoneNumber.value,
                  placeHolder: "Mobile number",
                  onChanged: (val) => DataController.userPhoneNumber(val),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Birthday",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF292c57),
                    fontSize: 13.sp),
              ),
              SizedBox(height: 2.h),
              Obx(
                () => DTextField(
                  withShadow: false,
                  withBorder: true,
                  defaultValue: DateFormat("dd.MM.yyyy")
                      .format(DataController.birthday.value),
                  placeHolder: "Birthday",
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Location",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF292c57),
                    fontSize: 13.sp),
              ),
              SizedBox(height: 2.h),
              Obx(
                () => DTextField(
                  withShadow: false,
                  withBorder: true,
                  defaultValue: DataController.userLocation.value,
                  placeHolder: "Location",
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Skills",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF292c57),
                    fontSize: 13.sp),
              ),
              SizedBox(height: 3.h),
              DTextField(
                withShadow: false,
                controller: textController,
                withBorder: true,
                placeHolder: "Skills",
                suffix: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.w, bottom: 2.w, right: 2.w),
                    child: GestureDetector(
                      onTap: () {
                        if (textController.text.isEmpty) return;
                        controller.profileController
                            .addSkill(textController.text);
                      },
                      child: Image.asset(
                        AssetsRes.PLUS_FILLED,
                        scale: 1.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Obx(() => Wrap(
                    spacing: 2.w,
                    runSpacing: 1.h,
                    children: DataController.skills
                        .asMap()
                        .map((key, element) => MapEntry(
                            key,
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffeaeaea),
                                ),
                                borderRadius: BorderRadius.circular(14.sp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(element),
                                    InkWell(
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
                                      onTap: () {
                                        controller.profileController
                                            .removeSkill(key);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: const Color(0xff292c57),
                                        size: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )))
                        .values
                        .toList(),
                  )),
              SizedBox(height: 4.h),
              SizedBox(
                width: 90.w,
                child: const Divider(
                  thickness: 1.5,
                ),
              ),
              SizedBox(height: 2.h),
              ListTile(
                leading: Image.asset(
                  AssetsRes.PEN,
                  scale: 5,
                ),
                minLeadingWidth: 5.w,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                title: const Text(
                  "Education",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Text(
                  "Edit",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF5666d8)),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  AssetsRes.SUITCASE,
                  scale: 5,
                ),
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 5.w,
                title: const Text(
                  "Experience",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Text(
                  "Edit",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF5666d8)),
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                width: 90.w,
                child: const Divider(
                  thickness: 1.5,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Documents",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF292c57),
                        fontSize: 13.sp),
                  ),
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
                        type: FileType.custom,
                      );
                      if (result == null) return;
                      DataController.documentList.add(result.files.single.path);
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          color: const Color(0xFF5666d8), fontSize: 11.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Obx(
                () => Column(
                  children: DataController.documentList
                      .map(
                        (element) => ListTile(
                          minVerticalPadding: 0,
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            AssetsRes.DOCUMENT,
                            scale: 4.sp,
                          ),
                          minLeadingWidth: 2.w,
                          title: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text(element!.split("/").last),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
