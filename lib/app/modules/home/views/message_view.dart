import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Matches",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AssetsRes.TOOLS,scale: 4.sp,),
                  SizedBox(width: 2.w,),
                  const Icon(Icons.more_vert,color: Colors.black,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
