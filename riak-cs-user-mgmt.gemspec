# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mgmt/version"

Gem::Specification.new do |gem|
  gem.name          = "riak-cs-user-mgmt"
  gem.version       = Mgmt::VERSION
  gem.authors       = ["Hector Castro"]
  gem.email         = ["hector@basho.com"]
  gem.homepage      = "https://hectcastro.github.com/riak-cs-user-mgmt"
  gem.summary       = %q{`mgmt` is a command-line tool that aids in Riak CS user management.}
  gem.description   = gem.summary

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(features)/})
  gem.executables   = ["mgmt"]
  gem.require_paths = ["lib"]

  gem.add_dependency "thor"

  gem.add_development_dependency "bundler", "~> 1.3"
end
