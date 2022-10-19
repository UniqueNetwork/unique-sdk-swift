Pod::Spec.new do |spec|

  spec.name         = "UniqueSDK"

  spec.version      = "0.0.1"

  spec.summary      = "SDK for blockchain in iOS Projects"

  spec.description  = "SDK for blockchain in iOS Projects description"

  spec.homepage     = "https://github.com/UniqueNetwork/unique-sdk-swift"

  spec.license      = "MIT"

  spec.author    = "MaxOl"

  spec.platform     = :ios, "13.0"

  spec.swift_version = "5.0"

  spec.source       = { 
	:git => "https://github.com/UniqueNetwork/unique-sdk-swift.git", 
	:tag => "#{spec.version}" 
}

  spec.source_files  = "UniqueSDK/**/*.{h,m,swift}"

  spec.public_header_files = "UniqueSDK/**/*.h"

end
