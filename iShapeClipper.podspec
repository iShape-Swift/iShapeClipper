Pod::Spec.new do |spec|

  spec.name                       = 'iShapeClipper'
  spec.version                    = '0.0.1'
  spec.summary                    = 'Clipping polygons'
  spec.authors                    = 'Nail Sharipov'
  spec.source                     = { :git => 'https://github.com/NailxSharipov/iShapeClipper.git', :tag => spec.version.to_s }
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage                   = 'https://github.com/NailxSharipov/iShapeClipper'


  spec.swift_versions             = ['4.2', '5.0']
  spec.requires_arc               = true

  spec.ios.deployment_target      = '9.0'
  spec.tvos.deployment_target     = '9.0'
  spec.osx.deployment_target      = '10.9'

  spec.source_files               = 'iShapeClipper/Source/**/*.swift'


  spec.dependency                 'iGeometry'

end