import 'clear_sale_behavior_analytics_platform_interface.dart';

class ClearSaleBehaviorAnalytics {
  
  Future<void> start(String appId) async => ClearSaleBehaviorAnalyticsPlatform.instance.start(appId);

  Future<void> stop() => ClearSaleBehaviorAnalyticsPlatform.instance.stop();

  Future<void> blockGeolocation() => ClearSaleBehaviorAnalyticsPlatform.instance.blockGeolocation();

  Future<void> blockAppList() => ClearSaleBehaviorAnalyticsPlatform.instance.blockAppList();

  Future<String?> collectInformation() => ClearSaleBehaviorAnalyticsPlatform.instance.collectInformation();
}
