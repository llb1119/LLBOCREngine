#
# Be sure to run `pod lib lint LLBOCREngine.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LLBOCREngine'
  s.version          = '0.1.0'
  s.summary          = 'OCR Engine'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        This engine can recognize business card, DOC and certificates etc.
                       DESC

  s.homepage         = 'https://github.com/llb1119/LLBOCREngine'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liulibo' => 'llb1119@163.com' }
  s.source           = { :git => 'https://github.com/llb1119/LLBOCREngine.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'

  s.source_files = 'LLBOCREngine/Classes/**/*'
#s.resources = "LLBOCREngine/Assets/**/*"
#s.resource_bundles = {
#  'LLBOCREngine' => ['LLBOCREngine/Assets/*']
#}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'CoreImage'
  s.libraries = 'stdc++.6.0.9'
  #s.dependency 'OpenCV'
  #s.dependency 'TesseractOCRiOS', '4.0.0'
end
