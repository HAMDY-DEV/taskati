import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.hint,required this.onChanged,this.validator});
  String hint;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
        decoration: InputDecoration(
      hintText: hint,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.primary)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.primary)),
    ));
  }
}
