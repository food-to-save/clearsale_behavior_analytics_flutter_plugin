import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'clear_sale_behavior_analytics_method_channel.dart';

abstract class ClearSaleBehaviorAnalyticsPlatform extends PlatformInterface {
  ClearSaleBehaviorAnalyticsPlatform() : super(token: _token);

  static final Object _token = Object();

  static ClearSaleBehaviorAnalyticsPlatform _instance = MethodChannelClearSaleBehaviorAnalytics();

  static ClearSaleBehaviorAnalyticsPlatform get instance => _instance;

  static set instance(ClearSaleBehaviorAnalyticsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
