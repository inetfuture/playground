Pod::Spec.new do |s|
  s.name         = "NetworkLib"
  s.version      = "0.0.1"
  s.summary      = "A short description of NetworkLib."

  s.description  = <<-DESC
                   A longer description of NetworkLib in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "http://EXAMPLE/NetworkLib"

  s.license      = "MIT (example)"

  s.author       = { "inetfuture(Aaron Wang)" => "inetfuture@gmail.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "http://EXAMPLE/NetworkLib.git", :tag => "0.0.1" }

  s.source_files = "NetworkLib", "NetworkLib/**/*.{h,m}"
  s.public_header_files = "NetworkLib/**/*.h"
  s.resources = "NetworkLib.plist"

  s.framework    = "SystemConfiguration"
  s.requires_arc = true

  s.dependency "AFNetworking"

end
