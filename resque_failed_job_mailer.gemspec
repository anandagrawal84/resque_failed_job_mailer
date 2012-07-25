# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "resque_failed_job_mailer/version"

Gem::Specification.new do |s|
  s.name        = "resque_failed_job_mailer"
  s.version     = ResqueFailedJobMailer::VERSION
  s.authors     = ["Anand Agrawal"]
  s.email       = ["aagrawal@thoughtworks.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "resque_failed_job_mailer"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "actionmailer"
  s.add_development_dependency "resque"

end
