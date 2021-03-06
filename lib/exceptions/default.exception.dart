import '../utilities/logger.dart';

class DefaultException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  DefaultException({
    this.message = 'Internet error!',
    this.stackTrace,
  }) {
    LoggerService.instance.e(stackTrace);
  }

  @override
  String toString() => message;
}
