#
# Be sure to run `pod lib lint SwiftyDB.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SwifthDB"
  s.version          = "1.1.0"
  s.summary          = "Making SQLite databases a blast"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
#  s.description      = <<-DESC
#                       DESC

  s.homepage         = "https://github.com/swifth"
  s.license          = 'MIT'
  s.author           = { "Øyvind Grimnes" => "oyvindkg@yahoo.com" }
  s.source           = { :git => "https://github.com/swifth/swiftydb.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/oyvindkg'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.dependency 'TinySQLite', '~> 0.3.0'
  
end
