require "devise"
require "admin/engine"

module Admin
  
  class << self
    attr_accessor :app_name
  end
  
  # Yield self on setup for nice config blocks
  def self.setup(&block)
    yield self
  end
end
