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
  # 1. route 
  # namespace :admin do
  #   resources :posts
  # end
  #
  # 2. Insert authority to model
  #
  # Set authorizer class to UserAuthorizer
  # self.authorizer_name = 'UserAuthorizer'  
  #  
  # Adds `creatable_by?(user)`, etc
  # include Authority::Abilities
  
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
