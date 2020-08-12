Pod::Spec.new do |spec|

  spec.name                       = 'iShapeClipper'
  spec.version                    = '0.1.1'
  spec.summary                    = 'Clipping polygons'
  spec.authors                    = 'Nail Sharipov'
  spec.source                     = { :git => 'https://github.com/NailxSharipov/iShapeClipper.git', :tag => spec.version.to_s }
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage                   = 'https://github.com/NailxSharipov/iShapeClipper'


  spec.swift_versions             = ['4.2', '5.0']
  spec.requires_arc               = true

  spec.ios.deployment_target      = '9.0'
  spec.tvos.deployment_target     = '9.0'
  spec.watchos.deployment_target  = '4.0'
  spec.osx.deployment_target      = '10.9'

  spec.source_files               = 'Sources/**/*.swift'

  spec.dependency                 'iGeometry', '>= 1.7.0'

end