import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../res/assets_res.dart';
import '../controllers/user_details_controller.dart';

class UserDetailsView extends GetView<UserDetailsController> {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage(controller.user.value.images!.first),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.user.value.name!,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff292c57)),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "${controller.user.value.location} • ${controller.user.value.age} years",
                          style: TextStyle(
                              fontSize: 12.sp, color: const Color(0xff292c57)),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          !controller.user.value.isJob!
                              ? "About me"
                              : controller.user.value.mission!,
                          style: TextStyle(
                              fontSize: 12.sp,fontWeight: FontWeight.bold, color: const Color(0xff292c57)),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          controller.user.value.about!,
                          style: const TextStyle(color: Color(0xff646681)),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          !controller.user.value.isJob!
                              ? "Opening hours"
                              : "Requirements",
                          style: TextStyle(
                              fontSize: 12.sp,fontWeight: FontWeight.bold, color: const Color(0xff292c57)),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        if (!controller.user.value.isJob!)
                          Text(
                            controller.user.value.time!,
                            style: const TextStyle(color: Color(0xff646681)),
                          )
                        else
                          Text(
                            controller.user.value.requirements!,
                            style: const TextStyle(
                              color: Color(0xff646681),
                            ),
                          ),
                        SizedBox(
                          height: 2.h,
                        ),
                        if (!controller.user.value.isJob!)
                          Text(
                            "Services",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff292c57),
                            ),
                          ),
                        SizedBox(
                          height: 2.h,
                        ),
                        if (!controller.user.value.isJob!)
                          Wrap(
                            spacing: 3.w,
                            runSpacing: 2.h,
                            children: controller.user.value.services!
                                .map(
                                  (e) => Container(
                                    padding: EdgeInsets.all(8.sp),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      border: Border.all(
                                        color: const Color(0xffeaeaea),
                                      ),
                                    ),
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                          )
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Employment",style: TextStyle(fontWeight: FontWeight.bold,),),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          controller.user.value.typeJob!,
                                          style: const TextStyle(
                                            color: Color(0xff646681),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Location",style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          controller.user.value.locationJob!,
                                          style: const TextStyle(
                                            color: Color(0xff646681),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Salary",style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          controller.user.value.salary!,
                                          style: const TextStyle(
                                            color: Color(0xff646681),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Workload",style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          controller.user.value.workload!,
                                          style: const TextStyle(
                                            color: Color(0xff646681),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        if (!controller.user.value.isJob!)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${controller.user.value.reviews!.length} reviews",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff292c57),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rate_rounded,
                                        color: Color(0xffee9d48),
                                      ),
                                      Text(
                                        "${controller.user.value.reviews!.map((e) => e.rating!).reduce((value, element) => value + element) / controller.user.value.reviews!.length} (${controller.user.value.reviews!.length})",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: const Color(0xff292c57),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              ...controller.user.value.reviews!.map(
                                (e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RatingBarIndicator(
                                      rating: e.rating!,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.sp,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      e.text!,
                                      style: const TextStyle(
                                          color: Color(0xff646681)),
                                    ),
                                    SizedBox(height: 1.h,),
                                    Text(e.user!,style: TextStyle(color: Color(0xff9c9dac)),),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        else
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.user.value.agentName!,
                                    style: const TextStyle(
                                        color: Color(0xff292c57),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    controller.user.value.agentLocation!,
                                    style: const TextStyle(
                                      color: Color(0xff292c57),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                AssetsRes.CLOSE_CIRCLE,
                                scale: 3.5.sp,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Image.asset(
                              AssetsRes.HEART_CIRCLE,
                              scale: 3.5.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
