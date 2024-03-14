import 'package:hive/hive.dart';

class AppLocalStorage {
  static cachData({required key, required value}) {
    final box = Hive.box('user');
    box.put(key, value);
  }

  static getCachData({required key}) {
    final box = Hive.box('user');
    return box.get(key);
  }
}
