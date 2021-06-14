# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

def sharedpods
    pod 'Alamofire', '~> 5.2'
    pod 'SwiftLint'
    pod 'TSWebImageView'
end

def firebasepods
  pod 'Firebase/Crashlytics'
  pod 'Firebase/Analytics'
end

def debugpods
  pod 'atlantis-proxyman', '~> 1.4.3'
  pod 'FLEX', :configurations => ['dev', 'hml']
end

target 'TmdbMovieware' do
  # Comment the next line if you don't want to use dynamic frameworks
  
  use_frameworks!
  # Pods for Movieware
  sharedpods
  firebasepods
  debugpods

  target 'MoviewareTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MoviewareUITests' do
    # Pods for testing
  end

end

post_install do |pi|
  
    system('find "./Pods/Target Support Files" -name "*-resources.sh" | xargs -I{} patch -p0 {} -i ./copy_pod_resources_once.patch')
  
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
end
