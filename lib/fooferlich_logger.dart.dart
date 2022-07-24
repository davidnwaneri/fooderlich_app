// ignore_for_file: prefer_final_fields

import 'dart:developer' as dev show log;

extension Logger on Object? {
  static int _hour = DateTime.now().hour;
  static int _minute = DateTime.now().minute;
  static int _second = DateTime.now().second;
  void log() {
    dev.log('$this  at $_hour:$_minute:$_second');
  }
}
