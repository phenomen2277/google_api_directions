# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_api_directions/version'

Gem::Specification.new do |spec|
  spec.name          = "google_api_directions"
  spec.version       = GoogleApiDirections::VERSION
  spec.authors       = ["Jone Samra"]
  spec.email         = ["jonemob@gmail.com"]
  spec.summary       = %q{A ruby wrapper class for the Google Directions API.}
  spec.description   = %q{A ruby wrapper class for the Google Directions API.}
  spec.homepage      = "https://github.com/phenomen2277/google_api_directions"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "json", ">= 1.8.1"
end
