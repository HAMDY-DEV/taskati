import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/features/addTask/data/task_model.dart';
import 'package:taskati/features/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task');
  runApp(const Taskaty());
}

class Taskaty extends StatelessWidget {
  const Taskaty({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
