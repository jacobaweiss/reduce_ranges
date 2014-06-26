# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reduce_ranges/version'

Gem::Specification.new do |spec|
  spec.name          = 'reduce_ranges'
  spec.version       = ReduceRanges::VERSION
  spec.authors       = ['@jacobaweiss']
  spec.email         = ['jacobaweiss@gmail.com']
  spec.summary       = %q{Reduces consecutive elements of an array of integers into ranges.}
  spec.description   = %q{Given an array of integers, Array#reduce_ranges will return an array with all consecutive integers converted into ranges.}
  spec.homepage      = "https://github.com/jacobaweiss/reduce_ranges"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
