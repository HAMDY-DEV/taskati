import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/addTask/data/task_model.dart';
import 'package:taskati/features/addTask/presentation/widgets/custom_text_filde.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaslState();
}

class _AddTaslState extends State<AddTask> {
  var date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  var startTime = DateFormat('hh:mm a').format(DateTime.now());
  var endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 30)));
  int color = 0;
  var tatileController = TextEditingController();
  var noteController = TextEditingController();

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
                controller: tatileController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFilde(
                text: 'Note',
                maxLines: 4,
                controller: noteController,
                hint: 'Enter note here',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFilde(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now()
                              .add(const Duration(days: 365))
                              .year))
                      .then((value) => {
                            setState(() {
                              date = DateFormat.yMd().format(value!);
                            })
                          });
                },
                text: 'Date',
                hint: date,
                widget: const Icon(Icons.date_range_rounded),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFilde(
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) => {
                                  if (value != null)
                                    {
                                      setState(() {
                                        startTime = value.format(context);
                                      })
                                    }
                                });
                      },
                      readOnly: true,
                      text: 'Start',
                      hint: startTime,
                      widget: const Icon(Icons.access_time),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextFilde(
                      readOnly: true,
                      text: 'End Time',
                      hint: endTime,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) => {
                                  if (value != null)
                                    {
                                      setState(() {
                                        endTime = value.format(context);
                                      })
                                    }
                                });
                      },
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
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  color = index;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: index == 0
                                    ? AppColoes.primary
                                    : index == 1
                                        ? AppColoes.red
                                        : AppColoes.orange,
                                radius: 10,
                                child: color == index
                                    ? Icon(
                                        Icons.check,
                                        size: 15,
                                        color: AppColoes.white,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 125,
                    child: ElevatedButton(
                      onPressed: () {
                        String id = '${tatileController.text}${DateTime.now()}';
                        AppLocalStorage.cachTask(
                            key: id,
                            value: TaskModel(false,
                                id: id,
                                title: tatileController.text,
                                note: noteController.text,
                                date: date,
                                startTime: startTime,
                                endTime: endTime,
                                color: color));
                        print(AppLocalStorage.getCachTask(key: id)!.title);
                      },
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
