Pod::Spec.new do |s|
  s.name 'OMGFoursquare'
  s.version '0.0.1'
  s.platform :ios
  s.summary 'Foursquare API Wrapper'
  s.source :git => 'https://github.com/omgitsads/OMGFoursquare.git', :tag => 'v0.0.1'
  s.author 'Adam Holt'

  s.source_files = 'OMGFoursquare/*.{h,m}'
  s.clean_paths = ['OMGFoursquare.xcworkspace']

  s.dependency 'AFNetworking', '~> 0.7.0'
end
