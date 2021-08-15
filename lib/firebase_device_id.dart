
import 'dart:async';

import 'package:flutter/services.dart';

class FirebaseDeviceId {
  static const MethodChannel _channel =
      const MethodChannel('firebase_device_id');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
