# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baywatch/version'

Gem::Specification.new do |gem|
  gem.name          = "baywatch"
  gem.version       = Baywatch::VERSION
  gem.authors       = ["Thiago Dantas"]
  gem.email         = ["thiago.teixeira.dantas@gmail.com"]
  gem.description   = %q{Baywatch your code}
  gem.summary       = %q{Baywatch rescue}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", '~> 2.14.1'
  gem.add_development_dependency "mocha", '~> 1.0.0'
  gem.add_development_dependency "actionpack"
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'pry', '~> 0.9.12.6'
  gem.add_development_dependency 'activemodel'

end
