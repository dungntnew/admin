require "devise"
require "authority"

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin
    
  end
end
