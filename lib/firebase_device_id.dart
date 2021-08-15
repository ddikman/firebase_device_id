import 'dart:async';
import 'package:flutter/services.dart';

Future<String?> getDeviceToken() async {
  return await MethodChannel('firebase_device_id').invokeMethod('getDeviceToken');
}
