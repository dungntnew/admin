class Admin::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  # setup app
  def setup_app
    text = %Q[
      / ___|_   _|/ \  |  _ \_   _| / ___|| ____|_   _| | | |  _ \   
      \___ \ | | / _ \ | |_) || |   \___ \|  _|   | | | | | | |_) |   
       ___) || |/ ___ \|  _ < | |    ___) | |___  | | | |_| |  __/  
      |____/ |_/_/   \_\_| \_\|_|   |____/|_____| |_|  \___/|_|    
    
    ]
    say (text + "\n")
    
    @app_name = ask("Enter App Name? [Kayac Admin]")
    @email    = ask("Enter admin email? [admin@gmail.com]")
    @password = ask("Enter admin password? [password]")
    
    
    @app_name = "Kayac Admin" if @app_name.blank?
    @email    = "admin@gmail.com" if @email.blank?
    @password = "password" if @password.blank?
    template "config.rb", "config/initializers/admin.rb"
  end
  
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
    Admin::User.find_or_create_by(email: @email) do |u|
      u.name     = "Admin"
      u.password = @password
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
  
  def create_403_file
    template "403.html", "public/403.html"
  end
  
  def generate_kaminari_theme
    if yes?("Would you like to install kaminari bootstrap3 theme ?")
      generate "kaminari:views", "bootstrap3"
    else

      say("install kaminari bootstrap is canceled.")
      say("+---------------------------------------------+")
      say('| run: generate "kaminari:views", "bootstrap3 |')
      say("+---------------------------------------------+")
      say("to install kaminari later.")
    end
  end
  
  def install_complete
    text = %Q[
      _________                                     __        .__          __  .__                     ._.                                          
      \_   ___ \  ____   ____    ________________ _/  |_ __ __|  | _____ _/  |_|__| ____   ____   _____| |                                          
      /    \  \/ /  _ \ /    \  / ___\_  __ \__  \\   __\  |  \  | \__  \\   __\  |/  _ \ /    \ /  ___/ |                                          
      \     \___(  <_> )   |  \/ /_/  >  | \// __ \|  | |  |  /  |__/ __ \|  | |  (  <_> )   |  \\___ \ \|                                          
       \______  /\____/|___|  /\___  /|__|  (____  /__| |____/|____(____  /__| |__|\____/|___|  /____  >__                                          
              \/            \//_____/            \/                     \/                    \/     \/ \/                                          
      .___                 __         .__  .__             .___   _________                                          _____     .__  .__         ._. 
      |   | ____   _______/  |______  |  | |  |   ____   __| _/  /   _____/__ __   ____  ____  ____   ______ _______/ ____\_ __|  | |  | ___.__.| | 
      |   |/    \ /  ___/\   __\__  \ |  | |  | _/ __ \ / __ |   \_____  \|  |  \_/ ___\/ ___\/ __ \ /  ___//  ___/\   __\  |  \  | |  |<   |  || | 
      |   |   |  \\___ \  |  |  / __ \|  |_|  |_\  ___// /_/ |   /        \  |  /\  \__\  \__\  ___/ \___ \ \___ \  |  | |  |  /  |_|  |_\___  | \| 
      |___|___|  /____  > |__| (____  /____/____/\___  >____ |  /_______  /____/  \___  >___  >___  >____  >____  > |__| |____/|____/____/ ____| __ 
               \/     \/            \/               \/     \/          \/            \/    \/    \/     \/     \/                       \/      \/ 
    ]
    say (text + "\n")
  end
end
