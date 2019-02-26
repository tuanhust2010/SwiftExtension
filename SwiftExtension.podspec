<<<<<<< HEAD
Pod::Spec.new do |s|
s.name = 'SwiftExtension'
s.version = '0.1.1'
s.summary = 'The Extension Library'
s.description = <<-DESC
The Extension Library for IOS
DESC

s.homepage = 'https://github.com/tuanhust2010/SwiftExtension'
s.license = { type: 'MIT', file: 'LICENSE' }
s.authors = { 'Tuan nguyen' => 'tuanhust2010@gmail.com' }


s.ios.deployment_target = '10.0'

s.swift_version = '4.2'
s.source = { git: 'https://github.com/tuanhust2010/SwiftExtension.git', tag: s.version.to_s }
s.source_files = 'SwiftExtension/Extensions/*.swift'

end
