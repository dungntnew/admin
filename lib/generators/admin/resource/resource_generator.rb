class Admin::ResourceGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model, type: :string, banner: "model name, ex: post"
  argument :exclude, type: :array, banner: "exclude field, ex: id, created_at",
           :default => %w[id created_at updated_at]
  
  def create_controller
    template "controller.rb", "app/controllers/admin/#{model_name_plural}_controller.rb"
  end
  
  def create_views
    %w[_form edit index new show].each do |view|
       template "views/#{view}.html.erb", "app/views/admin/#{model_name_plural}/#{view}.html.erb"
    end
  end
  
  # TODO

  
  def resource_route
    
    # add resource to routes file
    gsub_file "config/routes.rb", /^.*__admin:resource:route:#{model_name}__.*(\n|\r)/, ''
    inject_into_file "config/routes.rb", 
       %Q[
         namespace :admin do                    #__admin:resource:route:#{model_name}__
            resources :#{model_name_plural}     #__admin:resource:route:#{model_name}__
         end                                    #__admin:resource:route:#{model_name}__
        ].split(/\n/).map { |line| line.gsub /^\s{8}/, ''}.join("\n"),
        :after => /Rails.application.routes.draw do/
  end
  
  # install authority into resource
  def install_authority
    
    # add Authority::Abilities to resource model
    # and set authority name to UserAuthority
    gsub_file "app/models/#{model_name}.rb", /^.*#__admin:resource:authority__.*(\n|\r)/, ''
    inject_into_file "app/models/#{model_name}.rb", 
        %Q[ 
         # config authority for admin_user                              #__admin:resource:authority__
         # adds method: creatable_by?(user), etc                        #__admin:resource:authority__
         # Edit config/initializers/authority.rb.                       #__admin:resource:authority__
         # That file documents all your options,                        #__admin:resource:authority__
         # but one of particular interest is config.abilities,          #__admin:resource:authority__
         # which defines the verbs and corresponding adjectives         #__admin:resource:authority__
         # in your app.                                                 #__admin:resource:authority__
         #                                                              #__admin:resource:authority__
         # This option determines what methods are added to your users, #__admin:resource:authority__
         # models and authorizers.                                      #__admin:resource:authority__
         # If you need to ask user.can_deactivate?(Satellite)           #__admin:resource:authority__
         # and                @satellite.deactivatable_by?(user)        #__admin:resource:authority__
         #                                                              #__admin:resource:authority__
         # add :deactivate => 'deactivatable' to the hash.              #__admin:resource:authority__
         # =>                                                           #__admin:resource:authority__
         # The defaults are:                                            #__admin:resource:authority__
         #  config.abilities =  {                                       #__admin:resource:authority__
         #   :create => 'creatable',                                    #__admin:resource:authority__
         #   :read   => 'readable',                                     #__admin:resource:authority__
         #   :update => 'updatable',                                    #__admin:resource:authority__
         #   :delete => 'deletable'                                     #__admin:resource:authority__
         # }                                                            #__admin:resource:authority__
         #                                                              #__admin:resource:authority__
         include Authority::Abilities                                   #__admin:resource:authority__
         # Set authorizer class to Admin::UserAuthorizer                #__admin:resource:authority__
         self.authorizer_name = 'UserAuthorizer'                        #__admin:resource:authority__
        ].split(/\n/).map { |line| line.gsub /^\s{8}/, ''}.join("\n"),
    
        :after => /ActiveRecord::Base/
    
  end
  
  # inject menu to access resource
  def resource_menu
    inject_into_file "app/views/admin/shared/_sidebar.html.erb", 
                    "\n<!-- admin:menu:start_for #{model_name_plural} -->\n" +
                    "<li><%= link_to #{index_url} do %>" +
                    "\n\t<i class='fa fa-fw fa-table'></i> #{controller_class_name}" +
                    "<% end %></li>" +
                    "\n<!-- admin:menu:end_for #{model_name_plural} -->\n",
                    :after => '<!-- admin:sidebar holder -->'
  end
  
  # TODO: Only Admin User can see resource menu
  
  def controller_class_name
    model.pluralize.camelize
  end
  
  def model_name
    model.singularize
  end
  
  def model_class
    model.camelize
  end
  
  def model_name_plural
    model.pluralize
  end
  
  def model_name_singualar
    model.singularize
  end
  
  def name_for_route
    "admin/#{model_name_plural}"
  end
  
  def columns
    model_class.constantize.column_names
  end
  
  def attributes
    model_class.constantize.column_names - exclude
  end
  
  def index_path
    "main_app.admin_#{model_name_plural}_path"
  end
  
  def new_path
    "main_app.new_admin_#{model_name}_path"
  end
  
  def create_path
    "main_app.admin_#{model_name_plural}_path"
  end
  
  def show_path
    "main_app.admin_#{model_name}_path"
  end
  
  def edit_path
    "main_app.edit_admin_#{model_name}_path"
  end
  
  def update_path
    "main_app.admin_#{model_name}_path"
  end
  
  def destroy_path
    "main_app.admin_#{model_name}_path"
  end
  
  def index_url
    "main_app.admin_#{model_name_plural}_url"
  end
end
