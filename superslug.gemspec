lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'superslug/version'

Gem::Specification.new do |spec|
  spec.name        = 'superslug'
  spec.version     = SuperSlug::VERSION
  spec.authors     = ['Warren Harrison','Sean Davis']
  spec.email       = ['warren@hungry-media.com','scdavis41@gmail.com']
  spec.homepage    = "https://github.com/seancdavis/mark_it_zero"
  spec.summary     = "Automate slug creation in your rails app"
  spec.description = ""
  spec.license     = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 4.1.0'

  spec.add_development_dependency "bundler", "~> 1.6"
end