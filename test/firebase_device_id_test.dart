import 'package:firebase_device_id/firebase_device_id.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('firebase_device_id');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'abc';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getDeviceToken', () async {
    expect(await getDeviceToken(), 'abc');
  });
}
