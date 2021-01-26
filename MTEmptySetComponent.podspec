#
# Be sure to run `pod lib lint MTEmptySetComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MTEmptySetComponent'
  s.version          = '1.0.0'
  s.summary          = '使用Category实现对DZEmptySet的封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  使用Category实现对DZEmptySet的封装，完成空白页面占位提示功能，使用起来更简单
                       DESC

  s.homepage         = 'https://github.com/lyleLH'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Major Tom' => 'v2top1lyle@gmail.com'  }
  s.source           = { :git => 'https://github.com/lyleLH/MTEmptySetComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'MTEmptySetComponent/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MTEmptySetComponent' => ['MTEmptySetComponent/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'DZNEmptyDataSet' 
  
end
