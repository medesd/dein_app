import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/routes/app_pages.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MessageHomeView extends StatelessWidget {
  const MessageHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Matches",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                 /* trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AssetsRes.TOOLS,
                        scale: 4.sp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                    ],
                  ),*/
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: DataController.matches.isEmpty
                      ? const Center(
                          child: Text("no Matches"),
                        )
                      : Wrap(
                          spacing: 2.w,
                          children: DataController.matches
                              .map(
                                (e) => GestureDetector(
                                  onTap: () => Get.toNamed(Routes.USER_DETAILS,
                                      arguments: e.id),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(1.sp),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: e.active!
                                                ? const Color(0xff34af63)
                                                : Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                        ),
                                        child: Container(
                                          height: 16.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffbfc8cd),
                                            borderRadius:
                                                BorderRadius.circular(10.sp),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage(e.images!.first),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        e.name!,
                                        style: const TextStyle(
                                            color: Color(0xff292c57),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 100.w,
            height: 66.h,
            color: const Color(0xfff1f6fd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Messages",
                  style: TextStyle(
                      color: const Color(0xff292c57),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.h,
                ),
                if (DataController.matches.isNotEmpty)
                  ListView.builder(
                    itemCount: DataController.matches.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      var user = DataController.matches.toList()[index];
                      return ListTile(
                        visualDensity: const VisualDensity(vertical: 4),
                        onTap: () {
                          Get.toNamed(Routes.MESSAGE, arguments: user);
                        },
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xffbfc8cd),
                          radius: 25.sp,
                          foregroundImage: AssetImage(user.images!.first),
                        ),
                        title: Text(
                          user.name!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        contentPadding: EdgeInsets.zero,
                        subtitle: DataController.messages
                                .where((p0) => p0.user == user.id)
                                .isEmpty
                            ? null
                            : Text(DataController.messages
                                .where((p0) => p0.user == user.id)
                                .first
                                .data!
                                .last
                                .message!),
                      );
                    },
                  )
                else
                  const Expanded(
                    child: Center(
                      child: Text("no messages"),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
