import 'package:flutter/material.dart';
showErrorDialogs({required context,required String text}){
ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text(text)));
}