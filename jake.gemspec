# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "jake/version"

spec = Gem::Specification.new do |s|
  s.name = %q{javajake}
  s.version = Jake::VERSION

  s.authors = ["Tomas Kramar","Ivan Plesko"]
  s.description = %q{Build java code with ease.}
  s.email = %q{kramar@fiit.stuba.sk}
  s.files = Dir.glob('lib/**/*.rb') + %w{Rakefile}
  s.has_rdoc = false
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Build java code with ease}
end
