import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'clear_sale_behavior_analytics_method_channel.dart';

abstract class ClearSaleBehaviorAnalyticsPlatform extends PlatformInterface {
  /// Constructs a ClearSaleBehaviorAnalyticsPlatform.
  ClearSaleBehaviorAnalyticsPlatform() : super(token: _token);

  static final Object _token = Object();

  static ClearSaleBehaviorAnalyticsPlatform _instance = MethodChannelClearSaleBehaviorAnalytics();

  /// The default instance of [ClearSaleBehaviorAnalyticsPlatform] to use.
  ///
  /// Defaults to [MethodChannelClearSaleBehaviorAnalytics].
  static ClearSaleBehaviorAnalyticsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ClearSaleBehaviorAnalyticsPlatform] when
  /// they register themselves.
  static set instance(ClearSaleBehaviorAnalyticsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
