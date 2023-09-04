import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clear_sale_behavior_analytics/clear_sale_behavior_analytics_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelClearSaleBehaviorAnalytics platform = MethodChannelClearSaleBehaviorAnalytics();
  const MethodChannel channel = MethodChannel('clear_sale_behavior_analytics');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
   // expect(await platform.getPlatformVersion(), '42');
  });
}
