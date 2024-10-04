Pod::Spec.new do |spec|

  spec.name         = "Journify"
  spec.version      = "0.1.5"
  spec.summary      = "Integrates event tracking and analytics"
  spec.homepage     = "https://github.com/journifyio/journify-ios-sdk"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author    = "journifyio"
  spec.platform     = :ios
  spec.ios.deployment_target = "15.0"
  spec.source       = { :git => "https://github.com/journifyio/journify-ios-sdk.git", :tag => spec.version }
  spec.source_files  = "Sources/**/*.swift"
  spec.swift_version = "4.2"
  spec.dependency "Sovran"

end
