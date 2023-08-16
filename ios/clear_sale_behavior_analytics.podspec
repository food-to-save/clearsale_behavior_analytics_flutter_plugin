#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint clear_sale_behavior_analytics.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'clear_sale_behavior_analytics'
  s.version          = '0.0.1'
  s.summary          = 'A ClearSale behavior analytics plugin'
  s.description      = <<-DESC
A ClearSale behavior analytics plugin
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
