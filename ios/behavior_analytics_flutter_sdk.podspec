#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint behavior_analytics_flutter_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |spec|
  spec.name                      = "CSBehavior"
  spec.version                   = "5.0.1"
  spec.summary                   = "Mobile behavior SDK (CSBehavior) from Clearsale."
  spec.description               = "Framework that collect public device information and send to Clearsale to improve services for anti fraud detection"
  spec.homepage                  = "https://br.clear.sale/"
  spec.author                    = "Clearsale"
  spec.license                   = { :type => 'Commercial', :file => "CSBehavior.xcframework/ios-arm64/CSBehavior.framework/csbehavior-license.md" }
  spec.platform                  = :ios
  spec.source                    = { :http => "https://device.clearsale.com.br/ios/CSBehavior.xcframework-5.0.1.zip" }
  spec.source_files              = 'CSBehavior.xcframework/*/CSBehavior.framework/Headers/*.h'
  spec.public_header_files       = 'CSBehavior.xcframework/*/CSBehavior.framework/Headers/*.h'
  spec.ios.deployment_target     = "9.0"
  spec.ios.vendored_frameworks   = 'CSBehavior.xcframework'
end

Pod::Spec.new do |s|
  s.name             = 'behavior_analytics_flutter_sdk'
  s.version          = '0.6.1'
  s.summary          = 'Clearsale fingerprint integration'
  s.description      = <<-DESC
Clearsale fingerprint integration
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.dependency 'CSBehavior', '5.0.1'
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
