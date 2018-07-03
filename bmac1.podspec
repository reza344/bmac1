Pod::Spec.new do |s|
  s.platform = :ios
  s.ios.deployment_target = ‘9.0’
  s.name = "bmac1"
  s.summary = "bmac1 provide bundle security.”
  s.requires_arc = true
  s.version = “1.0.0”
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { “Yalda Co” => “YaldaCo@Gmail.com" }

  s.homepage = "https://github.com/reza344/bmac1"

  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  # s.source = { :git => "https://github.com/JRG-Developer/RWPickFlavor.git", :tag => "#{s.version}"}

  s.framework = "UIKit"

  s.dependency 'Siren'
  s.dependency 'Alamofire'
  s.dependency 'SwiftyJSON'
  s.dependency 'RealmSwift'
  s.dependency 'NVActivityIndicatorView'
  s.dependency 'SwiftMessages'
  s.dependency 'SCLAlertView'
  s.dependency 'SwifterSwift'

  s.source_files = "bmac1/**/*.{swift}"
  s.resources = "bmac1/**/*.{png,jpeg,jpg,storyboard,xib}"
end