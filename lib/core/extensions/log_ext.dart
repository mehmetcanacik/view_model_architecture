import 'dart:developer' as dev show log;

extension LogX on Object {
  void log({String logName = ""}) => dev.log(toString(), name: logName);
}
