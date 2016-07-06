#!/usr/bin/env ruby

%w(lib shared).each do |dir|
  path = File.expand_path(File.join("..", dir), __FILE__)
  $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
end
require "clearwater/version"

Gem::Specification.new do |spec|
  spec.name = "clearwater"
  spec.version = Clearwater::VERSION
  spec.authors = ["Jamie Gaskins"]
  spec.email = ["jgaskins@gmail.com"]
  spec.summary = %q{Front-end Ruby web framework for fast, reasonable, and composable applications}
  spec.description = spec.summary
  spec.homepage = "https://clearwater-rb.github.io/"
  spec.license = "MIT"

  spec.files = Dir[File.join("lib", "**", "*"), File.join("opal", "**", "*"), File.join("shared", "**", "*")]
  spec.executables = Dir[File.join("bin", "**", "*")].map! { |f| f.gsub(/bin\//, "") }
  spec.test_files = Dir[File.join("test", "**", "*"), File.join("spec", "**", "*")]
  spec.require_paths = ["lib", "shared"]

  spec.add_runtime_dependency "opal"
  spec.add_runtime_dependency "bowser"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "opal-rspec"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
