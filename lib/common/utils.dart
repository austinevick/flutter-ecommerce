import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:overlay_support/overlay_support.dart';

final logger = Logger();

void simpleNotification(String msg, bool isError) {
  HapticFeedback.vibrate();
  showSimpleNotification(Text(msg),
      leading: const Icon(Icons.info_outline),
      background: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 5));
}
