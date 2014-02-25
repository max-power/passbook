# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'passbook/version'

Gem::Specification.new do |spec|
  spec.name          = "power-passbook"
  spec.version       = Passbook::VERSION
  spec.authors       = ["Max Power"]
  spec.email         = ["kevin.melchert@gmail.com"]
  spec.summary       = %q{Passbook pass generator.}
  spec.description   = %q{Passbook pass generator.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rubyzip", "~> 1.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
