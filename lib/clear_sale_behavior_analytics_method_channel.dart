import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'clear_sale_behavior_analytics_platform_interface.dart';

class MethodChannelClearSaleBehaviorAnalytics extends ClearSaleBehaviorAnalyticsPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('clear_sale_behavior_analytics');

  @override
  Future<void> start(String appId) async {
    await methodChannel.invokeMethod<void>('start', <String, dynamic>{"appId": appId});
  }

  @override
  Future<void> stop() async {
    await methodChannel.invokeMethod<void>('stop');
  }

  @override
  Future<void> blockAppList() async {
    return methodChannel.invokeMethod<void>('blockAppList');
  }

  @override
  Future<void> blockGeolocation() async {
    return methodChannel.invokeMethod<void>('blockLocation');
  }

  @override
  Future<String?> collectInformation() async {
    return methodChannel.invokeMethod<String>('collectInformation');
  }
}
