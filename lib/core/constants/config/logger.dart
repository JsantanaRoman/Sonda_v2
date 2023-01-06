import 'dart:developer' as developer;

/// The main logger
class Logger {
  ///Logs an event to the console
  static void log(dynamic message, {String className = 'BelieveApp'}) =>
      developer.log(message.toString(), name: className);
}
