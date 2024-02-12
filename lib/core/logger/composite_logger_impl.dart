import 'package:logger/logger.dart';
import 'package:notif/core/logger/composite_logger.dart';

class CompositeLoggerImpl implements CompositeLogger {
  CompositeLoggerImpl({required this.logger});

  final Logger logger;

  @override
  void i(String message) {
    logger.i(message);
  }

  @override
  void e(
    String message, [
    Object? error,
  ]) {
    logger.e(message, error: error);
  }
}
