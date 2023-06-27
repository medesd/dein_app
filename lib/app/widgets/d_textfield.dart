import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DTextField extends StatefulWidget {
  final String? placeHolder;
  final TextEditingController? controller;
  final bool area;
  final Function(String val)? onChanged;

  const DTextField(
      {super.key,
      this.placeHolder,
      this.area = false,
      this.controller,
      this.onChanged});

  @override
  State<DTextField> createState() => _DTextFieldState();
}

class _DTextFieldState extends State<DTextField> {
  var counter = 0;

  OutlineInputBorder normalBorder({Color color = Colors.transparent}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.area ? 15.5.h : 8.h,
      decoration: widget.area
          ? null
          : BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0x348D8D8D),
                    blurRadius: 15.sp,
                    spreadRadius: 10.sp),
              ],
            ),
      child: Stack(
        children: [
          TextFormField(
            maxLength: widget.area ? 250 : null,
            controller: widget.controller,
            onChanged: (val) {
              setState(() {
                counter = val.length;
              });
              if (widget.onChanged == null) return;
              widget.onChanged!(val);
            },
            maxLines: widget.area ? 4 : 1,
            decoration: InputDecoration(
              filled: true,
              hintText: widget.placeHolder,
              counterText: "",
              hintStyle: const TextStyle(color: Color(0xFF9c9dac)),
              fillColor: Colors.white,
              border: widget.area
                  ? normalBorder(
                      color: Color(0xffeaeaea),
                    )
                  : normalBorder(),
              focusedBorder: widget.area
                  ? normalBorder(
                      color: Color(0xffeaeaea),
                    )
                  : normalBorder(),
              focusedErrorBorder: normalBorder(color: Colors.red),
              errorBorder: normalBorder(color: Colors.red),
              disabledBorder: normalBorder(color: Colors.grey),
              enabledBorder: widget.area
                  ? normalBorder(
                      color: Color(0xffeaeaea),
                    )
                  : normalBorder(),
            ),
          ),
          if(widget.area)
          Positioned(
            bottom: 5,
            right: 5,
            child: Text(
              "${250 - counter}",
              style: const TextStyle(
                color: Color(0xFF9c9dac),
              ),
            ),
          )
        ],
      ),
    );
  }
}
