#
# Be sure to run `pod lib lint Colortools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Colortools"
  s.version          = "0.1.0"
  s.summary          = "Some convenient methods and properties for UIColor"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  Colortools extends UIColor with new properties and methods that inform you about existing UIColors, and help you modify and create new UIColors.
                       DESC

  s.homepage         = "https://github.com/runkmc/Colortools"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Kevin McGladdery" => "kevin.mcgladdery@gmail.com" }
  s.source           = { :git => "https://github.com/runkmc/Colortools.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/run_kmc'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Colortools' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
