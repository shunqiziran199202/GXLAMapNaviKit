#
# Be sure to run `pod lib lint GXLAMapNaviKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GXLAMapNaviKit'
  s.version          = '0.1.2'
  s.summary          = 'GXLAMapNaviKit.'
  s.swift_version    =  '5'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
GXLAMapNaviKit 高德地图 导航
                       DESC

  s.homepage         = 'https://github.com/shunqiziran199202'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bpdnd' => '3438291751@qq.com' }
  s.source           = { :git => 'https://github.com/shunqiziran199202/GXLAMapNaviKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'GXLAMapNaviKit/Vendors/*.framework/Headers/**.h',
  s.public_header_files = 'GXLAMapNaviKit/Vendors/*.framework/Headers/**.h'
  s.resources = 'GXLAMapNaviKit/Vendors/*.framework/AMap.bundle','GXLAMapNaviKit/Vendors/*.framework/AMapNavi.bundle'
  s.frameworks = 'UIKit', 'SystemConfiguration','CoreTelephony','Security','GLKit'
  s.libraries  = 'c++'
  s.dependency 'GXLAMapFoundation'
  
  s.vendored_frameworks =  'GXLAMapNaviKit/Vendors/*.framework'
  s.preserve_paths = 'GXLAMapNaviKit/Vendors/*.framework'
  s.pod_target_xcconfig = {
            'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/*.framework/Headers',
            'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/',
            'OTHER_LDFLAGS' => '-ObjC'
  }
  
  s.prepare_command = <<-EOF
    # 创建Base Module
    rm -rf GXLAMapNaviKit/Vendors/AMapNaviKit.framework/Modules
    mkdir GXLAMapNaviKit/Vendors/AMapNaviKit.framework/Modules
    touch GXLAMapNaviKit/Vendors/AMapNaviKit.framework/Modules/module.modulemap
    cat <<-EOF > GXLAMapNaviKit/Vendors/AMapNaviKit.framework/Modules/module.modulemap
    framework module AMapNaviKit {
      umbrella header "AMapNaviKit.h"
      export *
    }
    \EOF
  EOF
  # s.resource_bundles = {
  #   'GXLAMapNaviKit' => ['GXLAMapNaviKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
