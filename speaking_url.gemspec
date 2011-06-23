# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "speaking_url/version"

Gem::Specification.new do |s|
  s.name        = "speaking_url"
  s.version     = SpeakingUrl::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kai Rubarth"]
  s.email       = ["kai@doxter.de"]
  s.homepage    = ""
  s.summary     = %q{allows arbitrary url for resources and facilitates seo-friendly changing of urls.}
  s.description = %q{Provides the possibility to have arbitrary URL for resources.}

  s.rubyforge_project = "speaking_url"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('rails')
  s.add_dependency('mongoid')
  s.add_development_dependency('shoulda')
  s.add_development_dependency('mocha')

end


