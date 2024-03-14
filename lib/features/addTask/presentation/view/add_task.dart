import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaslState();
}

class _AddTaslState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColoes.primary,
        title: Text(
          'Add Task',
          style: getTextStyle(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextFilde(
                text: 'Title',
                hint: 'Enter title here',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFilde(
                text: 'Note',
                hint: 'Enter note here',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFilde(
                text: 'Date',
                hint: '10/30/2023',
                widget: const Icon(Icons.date_range_rounded),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFilde(
                      text: 'Start',
                      hint: '02:30 AM',
                      widget: const Icon(Icons.access_time),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextFilde(
                      text: 'End Time',
                      hint: '02:45 AM',
                      widget: const Icon(Icons.access_time),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Coloe',
                          style: getBodyStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColoes.primary,
                            radius: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            backgroundColor: AppColoes.red,
                            radius: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            backgroundColor: AppColoes.orange,
                            radius: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 125,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColoes.primary,
                          foregroundColor: AppColoes.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Create Task'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
