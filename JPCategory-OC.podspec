
Pod::Spec.new do |s|

  s.name         = "JPCategory-OC"
  s.version      = "1.0.3"
  s.summary      = "view categories."
  s.homepage     = "https://github.com/baiyidjp/JPCategory_OC"
  s.license      = "MIT"
  s.author             =  "baiyidjp"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/baiyidjp/JPCategory_OC.git", :tag => "#{s.version}" }
  s.source_files  = "JPCategory_OC/*.{h,m}"
  s.requires_arc = true

  #UIButton
  s.subspec 'JPButtonCategory-OC' do |ss|
  ss.source_files = "JPCategory_OC/UIButton/*.{h,m}"
  end
# pod trunk push --allow-warnings

end
