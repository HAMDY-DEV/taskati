import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.onPressed,this.width});

  String text;
  Function() onPressed;
  double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 190,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColoes.primary,
            foregroundColor: AppColoes.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(text),
      ),
    );
  }
}
