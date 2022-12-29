source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!

def shared_pods
 
    pod 'SwiftyJSON'
    pod 'IQKeyboardManagerSwift'
    pod 'Toaster'
    pod 'LBTATools'
    pod 'SWXMLHash', '~> 5.0.1'
    pod 'Alamofire'
   end

target 'Ridwan-Test' do
  shared_pods
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
        target.build_configurations.each do |config|
            config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        end
      end
    end
  end
