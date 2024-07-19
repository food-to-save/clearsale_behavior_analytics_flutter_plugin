import 'dart:async';
import 'package:flutter/services.dart';

class BehaviorAnalyticsFlutterSdk {
  static const MethodChannel _channel =
      const MethodChannel('behavior_analytics_flutter_sdk');

  static Future<void> start(String appKey) async {
    await _channel.invokeMethod('start', [appKey]);
  }

  static Future<String> generateSessionID() async {
    final String sessionID = await _channel.invokeMethod('generateSessionID');
    return sessionID;
  }

  static Future<void> collectDeviceInformation(String sessionID) async {
    await _channel.invokeMethod('collectDeviceInformation', [sessionID]);
  }
}
