import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:clear_sale_behavior_analytics/clear_sale_behavior_analytics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _clearSaleBehaviorAnalyticsPlugin = ClearSaleBehaviorAnalytics();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await _clearSaleBehaviorAnalyticsPlugin.start('');
    await _clearSaleBehaviorAnalyticsPlugin.blockAppList();
    await _clearSaleBehaviorAnalyticsPlugin.blockGeolocation();
    final sessionId = await _clearSaleBehaviorAnalyticsPlugin.collectInformation();
    log('session ID: $sessionId');
    await _clearSaleBehaviorAnalyticsPlugin.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
      ),
    );
  }
}
