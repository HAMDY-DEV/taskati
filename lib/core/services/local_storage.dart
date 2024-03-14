import 'package:hive/hive.dart';

class AppLocalStorage {
  static final box = Hive.box('user');

  static cachData({required key, required value}) {
    box.put(key, value);
  }

  static getCachData({required key}) {
    return box.get(key);
  }
}
