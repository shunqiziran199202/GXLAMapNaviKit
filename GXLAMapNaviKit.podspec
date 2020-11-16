#
# Be sure to run `pod lib lint GXLAMapNaviKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GXLAMapNaviKit'
  s.version          = '7.6.0'
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
  
  s.default_subspecs = 'AMapFoundation-NO-IDFA', 'AMapLocation-NO-IDFA', 'AMapNavi-NO-IDFA', 'AMapSearch-NO-IDFA'
  
  #------ AMapFoundation-NO-IDFA
  s.subspec 'AMapFoundation-NO-IDFA' do |ss|
    ss.source_files = 'GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/*.framework/Headers/**.h'
    ss.public_header_files = 'GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/*.framework/Headers/**.h'
    ss.frameworks = 'UIKit', 'SystemConfiguration','CoreTelephony','Security','GLKit'
    ss.libraries  = 'c++'
    ss.vendored_frameworks =  'GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/*.framework'
    ss.preserve_paths = 'GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/*.framework'
    ss.pod_target_xcconfig = {
              'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/*.framework/Headers',
              'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/',
              'OTHER_LDFLAGS' => '-ObjC'
    }
  end
  
  #------ AMapLocation-NO-IDFA
  s.subspec 'AMapLocation-NO-IDFA' do |ss|
    ss.source_files = 'GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/*.framework/Headers/**.h'
    ss.public_header_files = 'GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/*.framework/Headers/**.h'
    ss.vendored_frameworks =  'GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/*.framework'
    ss.preserve_paths = 'GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/*.framework'
    ss.pod_target_xcconfig = {
              'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/*.framework/Headers',
              'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/',
    }
    ss.dependency 'GXLAMapNaviKit/AMapFoundation-NO-IDFA'
  end
  
  #------ AMapNavi-NO-IDFA
  s.subspec 'AMapNavi-NO-IDFA' do |ss|
    ss.source_files = 'GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/*.framework/Headers/**.h'
    ss.public_header_files = 'GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/*.framework/Headers/**.h'
    ss.vendored_frameworks =  'GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/*.framework'
    ss.preserve_paths = 'GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/*.framework'
    s.resources = 'GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/*.framework/AMap.bundle','GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/*.framework/AMapNavi.bundle'
    ss.pod_target_xcconfig = {
              'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/*.framework/Headers',
              'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/',
    }
    ss.dependency 'GXLAMapNaviKit/AMapFoundation-NO-IDFA'
  end
  
  #------ AMapSearch-NO-IDFA
  s.subspec 'AMapSearch-NO-IDFA' do |ss|
    ss.source_files = 'GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/*.framework/Headers/**.h'
    ss.public_header_files = 'GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/*.framework/Headers/**.h'
    ss.vendored_frameworks =  'GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/*.framework'
    ss.preserve_paths = 'GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/*.framework'
    ss.pod_target_xcconfig = {
              'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/*.framework/Headers',
              'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/',
    }
    ss.dependency 'GXLAMapNaviKit/AMapFoundation-NO-IDFA'
  end
  
  s.prepare_command = <<-EOF
    
    # 创建Base Module
    rm -rf GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules
    mkdir GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules
    touch GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules/module.modulemap
    cat <<-EOF > GXLAMapNaviKit/Vendors/AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules/module.modulemap
    framework module AMapFoundationKit {
      umbrella header "AMapFoundationKit.h"
      export *
    }
    \EOF
    
    # 创建Location Module
    rm -rf GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/AMapLocation.framework/Modules
    mkdir GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/AMapLocation.framework/Modules
    touch GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/AMapLocation.framework/Modules/module.modulemap
    cat <<-EOF > GXLAMapNaviKit/Vendors/AMapLocation-NO-IDFA/AMapLocation.framework/Modules/module.modulemap
    framework module AMapLocation {
      umbrella header "AMapLocation.h"
      export *
    }
    \EOF
    
    
    # 创建Navi Module
    rm -rf GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/AMapNaviKit.framework/Modules
    mkdir GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/AMapNaviKit.framework/Modules
    touch GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/AMapNaviKit.framework/Modules/module.modulemap
    cat <<-EOF > GXLAMapNaviKit/Vendors/AMapNavi-NO-IDFA/AMapNaviKit.framework/Modules/module.modulemap
    framework module AMapNaviKit {
      umbrella header "AMapNaviKit.h"
      export *
    }
    \EOF
    
    # 创建search Module
    rm -rf GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/AMapSearchKit.framework/Modules
    mkdir GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/AMapSearchKit.framework/Modules
    touch GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/AMapSearchKit.framework/Modules/module.modulemap
    cat <<-EOF > GXLAMapNaviKit/Vendors/AMapSearch-NO-IDFA/AMapSearchKit.framework/Modules/module.modulemap
    framework module AMapSearchKit {
      umbrella header "AMapSearchKit.h"
      export *
    }
    \EOF
    
  EOF

end
