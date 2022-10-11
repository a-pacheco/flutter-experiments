import 'package:flutter_application_v1/repository/database.dart';

class BaseRepository {
  static BaseRepository? _instance;
  BaseRepository._();

  AppDatabase? database;

  static Future<BaseRepository> getInstance() async {
    if (_instance != null) {
      return _instance!;
    }

    _instance = BaseRepository._();
    await _instance!._init();

    return _instance!;
  }

  Future<void> _init() async {
    database = await $FloorAppDatabase.databaseBuilder('cost_control.db').build();
  }
}
