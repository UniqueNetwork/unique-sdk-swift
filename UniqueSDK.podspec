Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '13.0'
s.name = "UniqueSDK"
s.summary = "UniqueSDK allows allows developers to integrate with polkadot blockchain."
s.requires_arc = true

# 2
s.version = "0.0.6"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Unique Network" => "uniquenetworkdev@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/UniqueNetwork/unique-sdk-swift"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/UniqueNetwork/unique-sdk-swift.git", 
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"
s.dependency 'Bip39.swift'
s.dependency 'Sr25519'
s.dependency 'KeychainAccess'

# 8
s.source_files = "UniqueSDK/**/*.{h,m,swift,plist}"

# 9

# 10
s.swift_version = "4.0"

end
