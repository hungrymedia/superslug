lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'superslug/version'
Gem::Specification.new do |s|
  s.name        = 'superslug'
  s.version     = SuperSlug::VERSION
  s.summary     = "Slugs, yo!"
  s.description = "A simple gem to autocreate slugs"
  s.authors     = ['Warren Harrison','Sean Davis']
  s.email       = ['warren@hungry-media.com','scdavis41@gmail.com']
  s.files       = `git ls-files -z`.split("\x0")
  s.license       = 'MIT'
end