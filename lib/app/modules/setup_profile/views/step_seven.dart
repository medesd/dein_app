import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StepSeven extends StatelessWidget {
  const StepSeven({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
        SizedBox(
          width: 90.w,
          child: const Divider(
            thickness: 1.5,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          "Documents",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF292c57),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        ListTile(
          leading: Image.asset(
            AssetsRes.PLUS,
            scale: 5,
          ),
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
              type: FileType.custom,
            );
            if(result==null) return;
            DataController.documentList.add(result.files.single.path);
          },
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 5.w,
          title: const Text(
            "Add documents",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Obx(
          () => Column(
            children: DataController.documentList
                .map(
                  (element) => ListTile(
                    minVerticalPadding: 0,
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading:Image.asset(AssetsRes.DOCUMENT,scale: 4.sp,),
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
    );
  }
}
