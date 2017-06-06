# Uncomment this line to define a global platform for your project
use_frameworks!

target 'BeerCityCode' do
	source 'https://github.com/CocoaPods/Specs.git'

	pod 'ObjectMapper', '2.2.1'
	pod 'AlamofireDomain', '4.1'
	
	platform :ios, '10.0'

end

target 'BeerCityCodeTests' do
	source 'https://github.com/CocoaPods/Specs.git'

	pod 'ObjectMapper', '2.2.1'
	
	platform :ios, '10.0'

end


target 'BeerCityCodeUITests' do
	source 'https://github.com/CocoaPods/Specs.git'

	pod 'ObjectMapper', '2.2.1'
	
	platform :ios, '10.0'

end



post_install do |installer|   
  installer.pods_project.targets.each do |target|
   target.build_configurations.each do |configuration|
     configuration.build_settings['SWIFT_VERSION'] = "3.0"
   end   
  end 
end