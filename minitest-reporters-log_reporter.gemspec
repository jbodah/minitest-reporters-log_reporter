Gem::Specification.new do |s|
  s.name        = 'minitest-reporters-log_reporter'
  s.version     = '0.0.1'
  s.date        = '2014-11-10'
  s.summary     = "a log reporter extension for minitest-reporters"
  s.description = "requires minitest-reporters"
  s.authors     = ["Josh Bodah"]
  s.email       = 'jb3689@yahoo.com'
  s.files       = ["lib/minitest/reporters/log_reporter.rb"]
  s.homepage    = 'https://github.com/jbodah/minitest-reporters-log_reporter'
  s.license     = 'MIT'

  s.add_runtime_dependency 'minitest-reporters', '~>1'
end
