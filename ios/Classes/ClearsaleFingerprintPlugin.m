#import "ClearsaleFingerprintPlugin.h"
#if __has_include(<behavior_analytics_flutter_sdk/behavior_analytics_flutter_sdk-Swift.h>)
#import <behavior_analytics_flutter_sdk/behavior_analytics_flutter_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "behavior_analytics_flutter_sdk-Swift.h"
#endif

@implementation ClearsaleFingerprintPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftClearsaleFingerprintPlugin registerWithRegistrar:registrar];
}
@end
