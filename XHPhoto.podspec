Pod::Spec.new do |s|
  s.name         = "XHPhoto"
  s.version      = "1.1"
  s.summary      = "一行代码搞定照片选择,支持相册/相机及是否裁剪"
  s.homepage     = "https://github.com/CoderZhuXH/XHPhoto"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Zhu Xiaohui" => "977950862@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderZhuXH/XHPhoto.git", :tag => s.version }
  s.source_files = "XHPhoto", "*.{h,m}"
  s.requires_arc = true
end
