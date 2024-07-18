import Flutter
import UIKit
import AppTrackingTransparency

public class SwiftClearsaleFingerprintPlugin: NSObject, FlutterPlugin {
    lazy var clearsale: Clearsale? = nil

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "behavior_analytics_flutter_sdk", binaryMessenger: registrar.messenger())
        let instance = SwiftClearsaleFingerprintPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)

        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { _ in
            }
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

        let args = call.arguments as? Array<String>
        switch call.method {
        case "start":
            let appKey : String = args?[0] ?? "";
            clearsale = Clearsale(appkey: appKey)
            result("Clearsale started with appkey: " + appKey);
        case "generateSessionID":
            result(clearsale?.generateSessionId())
        case "collectDeviceInformation":
            let sessionId : String = args?[0] ?? "";
            if(sessionId.isEmpty){
                result("Error: sessionId is empty");
            } else{
                clearsale?.collectDeviceInformation(sessionId: sessionId)
            }
            result("Collected device information with sessionId: " + sessionId )
        default:
            result("No method")
        }
    }
}
