package com.foodtosave.clearsale_behavior_analytics.clear_sale_behavior_analytics

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.lang.Exception

class ClearSaleBehaviorAnalyticsPlugin: FlutterPlugin, ActivityAware, MethodCallHandler {

  private var channel : MethodChannel? = null
  private var clearSaleManager: ClearSaleManager? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "clear_sale_behavior_analytics")
    channel?.setMethodCallHandler(this)
  }

  private  fun handleStart(call: MethodCall, result: Result) {
     val appId = call.argument<String>("appId")

    if(appId == null) {
      result.error("0", "appId must be not null", null)
      return
    }

     clearSaleManager?.start(appId)
     result.success(null)
  }

  private  fun handleStop(result: Result) {
      clearSaleManager?.stop()
      result.success(null)
  }

  private  fun handleBlockLocation(result: Result) {
      clearSaleManager?.blockGeolocation()
      result.success(null)
  }

  private  fun handleBlockAppList(result: Result) {
      clearSaleManager?.blockAppList()
      result.success(null)
  }

  private  fun handleCollectInformation(result: Result) {
    val sessionId = clearSaleManager?.collectInformation()
    result.success(sessionId)
  }


  override fun onMethodCall(call: MethodCall, result: Result) {
    try {
      when(call.method) {
        "start" -> handleStart(call, result)
        "stop" -> handleStop(result)
        "blockLocation" -> handleBlockLocation(result)
        "blockAppList" -> handleBlockAppList(result)
        "collectInformation" -> handleCollectInformation(result)
      }
    }catch (ex: Exception) {
      result.error("", "", ex)
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
    channel = null
  }

  override fun onAttachedToActivity(activityBinding: ActivityPluginBinding) {
    this.clearSaleManager = ClearSaleManager(activityBinding.activity)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    this.clearSaleManager = null
  }

  override fun onReattachedToActivityForConfigChanges(activityBinding: ActivityPluginBinding) {
    this.clearSaleManager = ClearSaleManager(activityBinding.activity)
  }

  override fun onDetachedFromActivity() {
    this.clearSaleManager = null
  }
}
