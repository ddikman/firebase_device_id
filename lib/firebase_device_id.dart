import 'dart:async';
import 'package:flutter/services.dart';

Future<String?> getDeviceToken() async {
  final String? version = await MethodChannel('firebase_device_id').invokeMethod('getDeviceToken');
  return version;
}
