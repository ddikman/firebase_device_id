if defined?($FirebaseSDKVersion)
  Pod::UI.puts "#{pubspec['name']}: Using user specified Firebase SDK version '#{$FirebaseSDKVersion}'"
  firebase_sdk_version = $FirebaseSDKVersion
else
  firebase_core_script = File.join(File.expand_path('..', File.expand_path('..', File.dirname(__FILE__))), 'firebase_core/ios/firebase_sdk_version.rb')
  if File.exist?(firebase_core_script)
    require firebase_core_script
    firebase_sdk_version = firebase_sdk_version!
    Pod::UI.puts "#{pubspec['name']}: Using Firebase SDK version '#{firebase_sdk_version}' defined in 'firebase_core'"
  end
end

Pod::Spec.new do |s|
  s.name             = 'firebase_device_id'
  s.version          = '0.0.1'
  s.summary          = 'Helper to get the firebase device ID to use for remote config testing.'
  s.description      = <<-DESC
Exposes the native Firebase Installations API to get a firebase installation auth token.
DESC
  s.homepage         = 'https://greycastle.se'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Greycastle' => 'david@greycastle.se' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.platform = :ios, '10.0'

  if not(firebase_sdk_version.nil?)
    s.dependency 'Firebase', firebase_sdk_version
    s.dependency 'Firebase/Installations', firebase_sdk_version
  else
    s.dependency 'Firebase'
    s.dependency 'Firebase/Installations'
  end

  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
