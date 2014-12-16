require "admin/engine"

module Admin
  
  class << self
    attr_accessor :config
  end
  
  def self.setup(&block)
    yield @config ||= Admin::Configuration.new
  end

  class Configuration
    include ActiveSupport::Configurable
    config_accessor :app_name
  end
end
