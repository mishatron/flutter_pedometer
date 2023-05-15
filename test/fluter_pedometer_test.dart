import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pedometer/flutter_pedometer.dart';
import 'package:flutter_pedometer/flutter_pedometer_platform_interface.dart';
import 'package:flutter_pedometer/flutter_pedometer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPedometerPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPedometerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPedometerPlatform initialPlatform = FlutterPedometerPlatform.instance;

  test('$MethodChannelFlutterPedometer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPedometer>());
  });

  test('getPlatformVersion', () async {
    Pedometer flutterPedometerPlugin = Pedometer();
    MockFlutterPedometerPlatform fakePlatform = MockFlutterPedometerPlatform();
    FlutterPedometerPlatform.instance = fakePlatform;

    expect(await flutterPedometerPlugin.getPlatformVersion(), '42');
  });
}
