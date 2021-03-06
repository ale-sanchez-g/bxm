# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bxm/version'

Gem::Specification.new do |spec|
  spec.name          = "bxm"
  spec.version       = Bxm::VERSION
  spec.authors       = ["alejandro"]
  spec.email         = ["asanchezgiraldo@bauerxcelmedia.com.au"]

  spec.summary       = %q{Creates random passwords in differente lenguages}
  spec.description   = %q{simple gem to generate easy and secure password}
  spec.homepage      = "https://github.com/asanchezgiraldo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.extra_rdoc_files = ['lib/words.csv',
                           'lib/palabras.csv',
                           'lib/worts.csv',
                           'lib/names.csv',
                           'lib/special.csv']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
