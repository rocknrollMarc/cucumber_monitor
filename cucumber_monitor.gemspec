$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cucumber_monitor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'cucumber_monitor'
  s.version = CucumberMonitor::VERSION
  s.authors = ["Marc Bluemner"]
  s.description = 'Visualization and manipulation of cucumber features.'
  s.summary = "Puts your features in a highlighted position. Adds a dashboard for viewing, searching and better identification of yours scenarios and steps."
  s.email = 'marc.bluemner@gmail.com'
  s.homepage = "https://github.com/rocknrollmarc/cucumber_monitor"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency 'cucumber-rails'
end
