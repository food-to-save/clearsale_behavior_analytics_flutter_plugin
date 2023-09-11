import 'dart:io';

import 'clear_sale_behavior_analytics_platform_interface.dart';

class ClearSaleBehaviorAnalytics {
  Future<void> start(String appId) async {
    return ClearSaleBehaviorAnalyticsPlatform.instance.start(appId);
  }

  Future<void> stop() async {
    if (Platform.isIOS) {
      return;
    }
    return ClearSaleBehaviorAnalyticsPlatform.instance.stop();
  }

  Future<void> blockGeolocation() async {
    if (Platform.isIOS) {
      return;
    }
    return ClearSaleBehaviorAnalyticsPlatform.instance.blockGeolocation();
  }

  Future<void> blockAppList() async {
    if (Platform.isIOS) {
      return;
    }
    return ClearSaleBehaviorAnalyticsPlatform.instance.blockAppList();
  }

  Future<String?> collectInformation() {
    return ClearSaleBehaviorAnalyticsPlatform.instance.collectInformation();
  }
}
