import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/background_service.dart';
import 'package:restaurant_app/utils/date_time_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledNotif(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      print('scheduling actived');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('scheduling canceled');
      notifyListeners();
      return AndroidAlarmManager.cancel(1);
    }
  }
}
