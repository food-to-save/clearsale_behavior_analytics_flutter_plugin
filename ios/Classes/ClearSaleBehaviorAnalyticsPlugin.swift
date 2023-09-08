import Flutter
import UIKit
import CSBehavior

public class ClearSaleBehaviorAnalyticsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "clear_sale_behavior_analytics", binaryMessenger: registrar.messenger())
    let instance = ClearSaleBehaviorAnalyticsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    
  var clearSaleManager = ClearSaleManager()
    
    
    public func wrapError(result: FlutterResult ,message: String, details: Any?) {
     result(FlutterError.init(code: "0", message: message, details: details))
  }
    
  public func handleStart(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
     let arguments = call.arguments as? Dictionary<String, Any>
     let appId = arguments?["appId"] as? String?
      
     try clearSaleManager.start(appId: appId!!)
     result(nil)
  }
    
  public func handleCollectInformation(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
      let sessionId = try clearSaleManager.collectInformation()
      result(sessionId)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      do {
          switch call.method {
          case "start":
              try handleStart(call: call, result: result)
            break
          case "collectInformation":
              try handleCollectInformation(call: call, result: result)
          default:
            result(FlutterMethodNotImplemented)
          }
      } catch CustomError.invalidState(let message) {
          wrapError(result: result, message: message, details: nil)
      } catch {
          wrapError(result: result, message: error.localizedDescription, details: error)
      }
  }
}


enum CustomError : Error {
    case invalidState(message: String)
}

class ClearSaleManager {
    
    private var behavior: CSBehavior?
    
    private var started = false
    
    func start(appId: String?) throws {
        
        
       if(appId == nil) {
           throw CustomError.invalidState(message: "appId must be non null")
       }
        
        if(started) {
            return
        }
        
        behavior = CSBehavior.getInstance(appId)
        started = true
    }
    
    func collectInformation() throws -> String {
        if(!started) {
            throw CustomError.invalidState(message: "you should call start before this method")
        }
        let sessionId = behavior?.generateSessionId()
        behavior?.collectDeviceInformation(sessionId)
        return sessionId!
    }
}
