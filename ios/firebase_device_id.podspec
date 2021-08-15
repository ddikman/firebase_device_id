#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint firebase_device_id.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'firebase_device_id'
  s.version          = '0.0.1'
  s.summary          = 'Helper to get the firebase device ID to use for remote config testing.'
  s.description      = <<-DESC
Helper to get the firebase device ID to use for remote config testing.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
