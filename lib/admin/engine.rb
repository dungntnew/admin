require "rails"
require "kaminari"
require "devise"
require "authority"
require "bootstrap-sass"


module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin
    
    initializer "admin.assets.precompile" do |app|
      app.config.assets.precompile += %w(application.css.scss application.js)
    end
  end
end
