//
// Created by Development on 16/06/21.
//

import CSBehavior

public class Clearsale {
    private var mInstance: CSBehavior;

    init(appkey: String?){
        mInstance = CSBehavior.getInstance(appkey);
    }

    public func generateSessionId() -> String? {
        return mInstance.generateSessionId();
    }

    public func collectDeviceInformation(sessionId: String){
        mInstance.collectDeviceInformation(sessionId);
    }
}
