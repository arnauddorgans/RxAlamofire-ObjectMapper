#
# Be sure to run `pod lib lint RxAlamofire-ObjectMapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxAlamofire+ObjectMapper'
  s.version          = '0.1.3'
  s.summary          = 'Reactive ObjectMapper extensions for RxAlamofire'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Reactive ObjectMapper extensions for RxAlamofire.
                       DESC

  s.homepage         = 'https://github.com/Arnoymous/RxAlamofire-ObjectMapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Arnoymous' => 'arnaud.dorgans@gmail.com' }
  s.source           = { :git => 'https://github.com/Arnoymous/RxAlamofire-ObjectMapper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/arnauddorgans'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.macos.deployment_target = '10.11'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'RxAlamofire-ObjectMapper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RxAlamofire-ObjectMapper' => ['RxAlamofire-ObjectMapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RxAlamofire', '~> 4.0'
  s.dependency 'ObjectMapper', '~> 3.0'

end
