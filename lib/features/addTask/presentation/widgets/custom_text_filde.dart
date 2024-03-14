
import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
// ignore: must_be_immutable
class CustomTextFilde extends StatelessWidget {
  CustomTextFilde(
      {super.key,
      required this.text,
      required this.hint,
      this.widget,
      this.width});

  String text;
  String hint;
  double? width;
  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: getBodyStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
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
    );
  }
}
