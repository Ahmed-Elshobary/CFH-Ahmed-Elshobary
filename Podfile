# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CFH-Task-Ahmed-Elshobary' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CFH-Task-Ahmed-Elshobary
pod 'IQKeyboardManagerSwift'
pod 'Alamofire'
pod 'MBProgressHUD'
pod 'AlamofireImage'
pod 'SideMenu'

  target 'CFH-Task-Ahmed-ElshobaryTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CFH-Task-Ahmed-ElshobaryUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
