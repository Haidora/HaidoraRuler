Pod::Spec.new do |s|
  s.name             = "HaidoraRuler"
  s.version          = "0.1.0"
  s.summary          = "Size matters, you need a ruler."
  s.description      = <<-DESC
                      Size matters, you need a ruler,may be you need for oc.
                       DESC

  s.homepage         = "https://github.com/Haidora/HaidoraRuler"
  s.license          = 'MIT'
  s.author           = { "mrdaios" => "mrdaios@gmail.com" }
  s.source           = { :git => "https://github.com/zenghaojim33/HaidoraRuler.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
#  s.resource_bundles = {
#    'HaidoraRuler' => ['Pod/Assets/*.png']
#  }
   s.frameworks = 'UIKit', 'Foundation'
end
