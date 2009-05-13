#
# rb_main.rb

# Created by Sergio Rubio on 5/11/09.
# Copyright Sergio Rubio <sergio@rubio.name>. All rights reserved.
#

# Loading the Cocoa framework. If you need to load more frameworks, you can
# do that here too.
$:.unshift  File.join(File.dirname(__FILE__), 'vendor/plist/lib')
$:.unshift  File.join(File.dirname(__FILE__), 'vendor/mime-types/lib')
$:.unshift  File.join(File.dirname(__FILE__), 'vendor/dropio/lib')
$:.unshift  File.join(File.dirname(__FILE__), 'vendor/macruby-json')
$:.unshift  File.join(File.dirname(__FILE__), '../Frameworks/MacRuby.framework/Versions/Current/usr/lib/ruby/1.9.1')
$:.unshift  File.join(File.dirname(__FILE__), '../Frameworks/MacRuby.framework/Versions/Current/usr/lib/ruby/1.9.1/universal-darwin9.5')
framework 'Cocoa'
require 'yaml'
require 'json'
require 'plist'
require 'dropio'

# Loading all the Ruby project files.
dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
Dir.entries(dir_path).each do |path|
  if path != File.basename(__FILE__) and path[-3..-1] == '.rb'
    require(path)
  end
end

# Starting the Cocoa main loop.
if IORB::Config.exist?
  Dropio.api_key = IORB::Config.api_key
end
NSApplicationMain(0, nil)
