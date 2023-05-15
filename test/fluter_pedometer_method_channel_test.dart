import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pedometer/flutter_pedometer_method_channel.dart';

void main() {
  MethodChannelFlutterPedometer platform = MethodChannelFlutterPedometer();
  const MethodChannel channel = MethodChannel('flutter_pedometer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
