$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "jake/version"

task :build do
  system "gem build jake.gemspec"
end

task :release => :build do
  system "gem push javajake-#{Jake::VERSION}.gem"
end
