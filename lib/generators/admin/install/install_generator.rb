class Admin::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../../templates', __FILE__)
  
  # copy migrations file from engine to app
  # end migrate with scope admin
  def migrations
    rake 'admin:install:migrations'
    rake 'db:migrate SCOPE=admin'
  end
  
  # setup default url options for mailer
  def config_mailer
     mailer_url = "config.action_mailer.default_url_options = { :host => 'localhost:3000' }"
     
     ['production', 'development', 'test'].each do |env|
       inject_into_file "config/environments/#{env}.rb",
              "\n\t#{mailer_url}",
              :after => /^.*config.action_mailer.*$/
  end
end
