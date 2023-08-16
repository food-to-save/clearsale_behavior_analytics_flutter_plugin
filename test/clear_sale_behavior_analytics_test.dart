import 'package:flutter_test/flutter_test.dart';
import 'package:clear_sale_behavior_analytics/clear_sale_behavior_analytics.dart';
import 'package:clear_sale_behavior_analytics/clear_sale_behavior_analytics_platform_interface.dart';
import 'package:clear_sale_behavior_analytics/clear_sale_behavior_analytics_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockClearSaleBehaviorAnalyticsPlatform
    with MockPlatformInterfaceMixin
    implements ClearSaleBehaviorAnalyticsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ClearSaleBehaviorAnalyticsPlatform initialPlatform = ClearSaleBehaviorAnalyticsPlatform.instance;

  test('$MethodChannelClearSaleBehaviorAnalytics is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelClearSaleBehaviorAnalytics>());
  });

  test('getPlatformVersion', () async {
    ClearSaleBehaviorAnalytics clearSaleBehaviorAnalyticsPlugin = ClearSaleBehaviorAnalytics();
    MockClearSaleBehaviorAnalyticsPlatform fakePlatform = MockClearSaleBehaviorAnalyticsPlatform();
    ClearSaleBehaviorAnalyticsPlatform.instance = fakePlatform;

    expect(await clearSaleBehaviorAnalyticsPlugin.getPlatformVersion(), '42');
  });
}
