#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ttlock_flutter.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'ttlock_flutter_ios'
  s.version          = '0.0.1'
  s.summary          = 'iOS implementation for ttlock_flutter.'
  s.description      = <<-DESC
iOS implementation for ttlock_flutter.
                       DESC
  s.homepage         = 'https://github.com/ttlock/ttlock_flutter.git'
  s.license          = "MIT"
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
#   s.vendored_frameworks = "Frameworks/**/*.framework"
  s.dependency 'TTLockOnPremise', '2.2.2'
  s.static_framework = true
  s.swift_version = '5.0'


  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
