lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-scoutforce/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-scoutforce"
  spec.version       = Omniauth::Scoutforce::VERSION
  spec.authors       = ["Ildar Manzhikov"]
  spec.email         = ["tech@scoutforce.com"]
  spec.summary       = %q{Official OmniAuth strategy for Scoutforce}
  spec.description   = %q{Official OmniAuth strategy for Scoutforce}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~> 1.0"
  spec.add_dependency "omniauth-oauth2", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.7"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
end