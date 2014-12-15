$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin"
  s.version     = Admin::VERSION
  s.authors     = ["Dung Nguyen"]
  s.email       = ["dungntnew@gmail.com"]
  s.homepage    = "http://dailymazii.blogspot.jp"
  s.summary     = "backed-end admin for rails."
  s.description = "admin page for rails with admin user, role, authority."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.8"
  s.add_dependency "sass-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "sprockets-rails"
  s.add_dependency "bootstrap-sass",  "~> 3.3.1"
  s.add_dependency "autoprefixer-rails"
  s.add_dependency "devise"
  s.add_dependency "authority"

  s.add_development_dependency "sqlite3"
end
