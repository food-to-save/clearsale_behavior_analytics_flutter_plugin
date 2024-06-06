//
// Created by Development on 16/06/21.
//

import CSBehavior
import CSBehavior.CSBUserEventType

public class Clearsale {
    private var mInstance: CSBehavior;

    init(appkey: String?){
        mInstance = CSBehavior.getInstance(appkey);
    }

    public func generateSessionId() -> String? {
        return mInstance.generateSessionId();
    }

    public func collectDeviceInformation(sessionId: String) async{
        await mInstance.collectDeviceInformation(sessionId);
    }

     public func sendEvent(userEventType: CSBUserEventType, sessionId: String) async{
         await mInstance.sendEvent(userEventType, sessionId);
     }
}
