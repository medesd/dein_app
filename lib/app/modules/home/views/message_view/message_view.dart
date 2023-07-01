import 'package:dein_app/app/data_controller.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    var dataController = Get.put(DataController());
    return SingleChildScrollView(
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
                  trailing: Row(
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
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Wrap(
                    spacing: 2.w,
                    children: dataController.users
                        .map(
                          (e) => Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(1.sp),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: e.active!
                                        ? const Color(0xff34af63)
                                        : Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                child: Container(
                                  height: 16.h,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffbfc8cd),
                                    borderRadius: BorderRadius.circular(10.sp),
                                    image: DecorationImage(
                                      image: AssetImage(e.images!.first),
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
            height: 50.h,
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
                ListView.builder(
                  itemCount: dataController.users.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    var user = dataController.users.toList()[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xffbfc8cd),
                        child: Image.asset(user.images!.first),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
