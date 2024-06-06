import Flutter
import UIKit
import AppTrackingTransparency
import CSBehavior.CSBUserEventType
import OSLog

public class SwiftClearsaleFingerprintPlugin: NSObject, FlutterPlugin {
    lazy var clearsale: Clearsale? = nil
    
    var events: [(key: String, value: CSBUserEventType)] {
            return [
                ("ACCOUNT_LOGIN", ACCOUNT_LOGIN),
                ("ACCOUNT_LOGIN_FAILURE", ACCOUNT_LOGIN_FAILURE),
                ("ACCOUNT_LOGOUT", ACCOUNT_LOGOUT),
                ("ACCOUNT_OPENING", ACCOUNT_OPENING),
                ("ACCOUNT_UPDATE", ACCOUNT_UPDATE),
                ("ACCOUNT_ONBOARDING", ACCOUNT_ONBOARDING),
                ("FACIAL_RECOGNITION", FACIAL_RECOGNITION),
                ("FINANCIAL_TRANSACTION", FINANCIAL_TRANSACTION),
                ("TRANSFER_BETWEEN_ACCOUNTS", TRANSFER_BETWEEN_ACCOUNTS),
                ("CREDIT_APPLICATION", CREDIT_APPLICATION),
                ("FINANCIAL_SERVICE_REQUEST", FINANCIAL_SERVICE_REQUEST),
                ("NON_FINANCIAL_SERVICE_REQUEST", NON_FINANCIAL_SERVICE_REQUEST),
                ("PASSWORD_CHANGE", PASSWORD_CHANGE),
                ("OTHER", OTHER),
                ("AUTHENTICATION", AUTHENTICATION),
            ];
        }

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
            Task {
                let sessionId : String = args?[0] ?? "";
                if(sessionId.isEmpty){
                    result("Error: sessionId is empty");
                } else{
                    await clearsale?.collectDeviceInformation(sessionId: sessionId)
                }
                result("Collected device information with sessionId: " + sessionId )
            }
        case "sendEvent":
            Task {
                let sessionId : String = args?[1] ?? "";
                
                if(sessionId.isEmpty){
                    result("Error: sessionId is empty.");
                }else{
                    let userEventTypeArgument = args?[0] ?? "";
                    
                    if let userEvent = getEventValueFor(key: userEventTypeArgument){
                        await clearsale?.sendEvent(userEventType: userEvent, sessionId: sessionId)
                    }else{
                        result("Error: Invalid Event.");
                    }
                }
            }
        default:
            result("No method")
        }
    }
    
    private func getEventValueFor(key: String) -> CSBUserEventType? {
        if let keyValueObject = events.first(where: {$0.key == key}){
            return keyValueObject.value;
        }
        return nil;
    }
}
