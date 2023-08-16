import 'clear_sale_behavior_analytics_platform_interface.dart';

class ClearSaleBehaviorAnalytics {
  Future<String?> getPlatformVersion() {
    return ClearSaleBehaviorAnalyticsPlatform.instance.getPlatformVersion();
  }
}
