import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/addTask/data/task_model.dart';
import 'package:taskati/features/addTask/presentation/view/add_task.dart';
import 'package:taskati/features/home/presentation/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            const Gap(40),
            //Header
            const HomeHeader(),
            const Gap(10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: getBodyStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Today',
                      style: getBodyStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () {
                    navigateTo(context, const AddTask());
                  },
                  text: '+ Add Task',
                  width: 120,
                )
              ],
            ),
            const Gap(10),
            DatePicker(
              height: 100,
              width: 80,
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColoes.primary,
              selectedTextColor: AppColoes.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  // _selectedValue = date;
                });
              },
            ),
            Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
              valueListenable: Hive.box<TaskModel>('task').listenable(),
              builder: (context, value, child) {
                List<TaskModel> tasks = [];
                for (var element in value.values) {
                  tasks.add(element);
                }
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      model: tasks[index],
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.model});
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColoes.primary),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.title,
                  style: getBodyStyle(
                      color: AppColoes.white, fontWeight: FontWeight.bold),
                ),
                const Gap(8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 20,
                      color: AppColoes.white,
                    ),
                    const Gap(10),
                    Text(
                      '${model.startTime} : ${model.endTime}',
                      style: getSmallStyle(color: AppColoes.white),
                    ),
                  ],
                ),
                const Gap(8),
                Text(
                  model.note,
                  style: getBodyStyle(color: AppColoes.white),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 0.5,
            height: 70,
            color: AppColoes.white,
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              model.isComplete ? 'COMPLETED' : 'TODO',
              style: getBodyStyle(color: AppColoes.white),
            ),
          ),
          const Gap(5),
        ],
      ),
    );
  }
}
