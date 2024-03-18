import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

// ignore: must_be_immutable
class CustomTextFilde extends StatelessWidget {
  CustomTextFilde(
      {super.key,
      required this.text,
      required this.hint,
      this.widget,
      this.maxLines,
      this.readOnly,
      this.onTap,
      this.controller,
      this.width});

  String text;
  String hint;
  int? maxLines;
  double? width;
  Widget? widget;
  bool? readOnly;
  void Function()? onTap;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: getBodyStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: controller,
              readOnly: readOnly ?? false,
              maxLines: maxLines ?? 1,
              decoration: InputDecoration(
                hintText: hint,
                suffixIcon: widget ?? const SizedBox(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColoes.primary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColoes.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
