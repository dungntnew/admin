class Admin::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  # copy migrations file from engine to app
  # end migrate with scope admin
  def migrations
    rake 'admin:install:migrations'
    rake 'db:migrate SCOPE=admin'
  end
  
  # # setup default url options for mailer
  # def config_mailer
  #    mailer_url = "config.action_mailer.default_url_options = { :host => 'localhost:3000' }"
  #
  #    ['production', 'development', 'test'].each do |env|
  #      inject_into_file "config/environments/#{env}.rb",
  #             "\n\t#{mailer_url}",
  #             :after => /^.*config.action_mailer.*$/
  # end
  
  def create_admin
    Admin::User.find_or_create_by(email: "dungntnew@gmail.com") do |u|
      u.name     = "Admin"
      u.password = "abcd1234"
      u.role     = "admin"
    end
  end
  
  def mount_engine
    # add engine to routes file
    gsub_file "config/routes.rb", /^.*__admin:install:engine__.*(\n|\r)/, ''
    inject_into_file "config/routes.rb", 
       %Q[
         mount Admin::Engine => "/admin"        #__admin:install:engine__
        ].split(/\n/).map { |line| line.gsub /^\s{8}/, ''}.join("\n"),
        :after => /Rails.application.routes.draw do/
  end
  
  def create_shared_menu
    template "_sidebar.html.erb", "app/views/admin/shared/_sidebar.html.erb"
  end
  
  # TODO: create 403 HTML FILE!
  
  def generate_kaminari_theme
    generate "kaminari:views", "bootstrap3"
  end
end
