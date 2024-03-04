import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final log = Logger(
  printer: PrettyPrinter(),
  level: kDebugMode ? Level.verbose : Level.nothing
);