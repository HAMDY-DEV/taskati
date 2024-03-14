import 'package:flutter/material.dart';

void navigateTo(context, Widget newView) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return newView;
    },
  ));
}

void navigateEithRplacment(context, Widget newView) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return newView;
    },
  ));
}