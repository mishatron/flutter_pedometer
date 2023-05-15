import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_pedometer_method_channel.dart';

abstract class            FlutterPedometerPlatform extends PlatformInterface {
  /// Constructs a FlutterPedometerPlatform.
  FlutterPedometerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPedometerPlatform _instance = MethodChannelFlutterPedometer();

  /// The default instance of [FlutterPedometerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPedometer].
  static FlutterPedometerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPedometerPlatform] when
  /// they register themselves.
  static set instance(FlutterPedometerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
