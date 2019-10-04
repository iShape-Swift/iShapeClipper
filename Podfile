platform :osx, '10.14'

target 'ClipperUI' do
	use_frameworks!

    project 'ClipperUI.xcodeproj'

	work_path = '../iGeometry'
	if File.exist?(work_path)
		puts "==> switch to work directory: " + work_path
		pod 'iGeometry', :path => work_path
	else
		puts "==> use cloud version"
		pod 'iGeometry'
	end

	pod 'iShapeClipper',				:path => './'


	post_install do |installer|
    	installer.pods_project.targets.each do |target|
        	if target.name == 'iShapeClipper'
            	target.build_configurations.each do |config|
                	config.build_settings['OTHER_SWIFT_FLAGS'] = '-DiShapeTest'
                	puts "iShapeTest flag added"
            	end
        	end
        end
    end

    target 'ClipperTests' do
        inherit! :search_paths
    end

end
