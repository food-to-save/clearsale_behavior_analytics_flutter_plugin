package com.clearsale.behavior.behavior_analytics_flutter_sdk;

import android.content.Context;

import androidx.annotation.NonNull;

import java.util.ArrayList;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

import sale.clear.behavior.android.Behavior;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import sale.clear.behavior.android.exceptions.CaptureWasStartedException;
import sale.clear.behavior.android.exceptions.SessionIDAlreadyUsedException;

import sale.clear.behavior.android.events.UserEventType;

/** BehaviorAnalyticsFlutterSdkPlugin */
public class BehaviorAnalyticsFlutterSdkPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;
  private Behavior behaviorInstance;
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "behavior_analytics_flutter_sdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if(call.method.equals("start")){
      try{
        ArrayList arguments = (ArrayList) call.arguments;
        String appKey = (String)arguments.get(0);
        if(behaviorInstance == null) {
          behaviorInstance = Behavior.getInstance(this.context, appKey);
        }
        behaviorInstance.start();
        result.success(null);
      }
      catch (Exception ex){
      result.error("10", ex.getMessage(), ex.getStackTrace());
      }
    }
    else if(call.method.equals("generateSessionID")){
      try{
        String sessionID = behaviorInstance.generateSessionID();
        result.success(sessionID);
      }
      catch (Exception ex){
        result.error("20", ex.getMessage(), ex.getStackTrace());
      }
      
    }
    else if(call.method.equals("collectDeviceInformation")) {
      try{
        ArrayList arguments = (ArrayList) call.arguments;
        String sessionID = (String)arguments.get(0);
        behaviorInstance.collectDeviceInformation(sessionID);
        behaviorInstance.stop();
        result.success(null);
      }
      catch (Exception ex){
        result.error("30", ex.getMessage(), ex.getStackTrace());
      }
    }
    else if(call.method.equals("sendEvent")){
      try{
        ArrayList arguments = (ArrayList) call.arguments;
        UserEventType userEvent = UserEventType.valueOf(arguments.get(0).toString());
        String sessionID = (String)arguments.get(1);
        behaviorInstance.sendEvent(userEvent, sessionID);
        result.success(null);
      }
      catch (Exception ex){
        result.error("40", ex.getMessage(), ex.getStackTrace());
      }
    }
    else {
      result.notImplemented();
    }
  }
  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.context = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    this.context = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    this.context = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    this.context = null;
  }
}