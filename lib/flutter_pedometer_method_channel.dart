import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_pedometer_platform_interface.dart';

/// An implementation of [FlutterPedometerPlatform] that uses method channels.
class MethodChannelFlutterPedometer extends FlutterPedometerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_pedometer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
