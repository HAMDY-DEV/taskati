import 'package:hive/hive.dart';
import 'package:taskati/features/addTask/data/task_model.dart';

class AppLocalStorage {
  static final box = Hive.box('user');
  static final boxTask = Hive.box<TaskModel>('task');

  static cachData({required key, required value}) {
    box.put(key, value);
  }

  static getCachData({required key}) {
    return box.get(key);
  }

  static cachTask({required key, required TaskModel value}) {
    boxTask.put(key, value);
  }

  static TaskModel? getCachTask({required key}) {
    return boxTask.get(key);
  }
}
