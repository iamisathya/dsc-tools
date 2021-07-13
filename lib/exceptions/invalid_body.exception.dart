import 'package:code_magic_ex/utilities/Logger/logger.dart';

class InvalidBodyException implements Exception {
  final String message;
  InvalidBodyException({required this.message}) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}
