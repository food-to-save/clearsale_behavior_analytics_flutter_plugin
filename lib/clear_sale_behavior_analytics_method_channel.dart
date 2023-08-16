import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'clear_sale_behavior_analytics_platform_interface.dart';

class MethodChannelClearSaleBehaviorAnalytics extends ClearSaleBehaviorAnalyticsPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('clear_sale_behavior_analytics');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
