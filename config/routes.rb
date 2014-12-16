Admin::Engine.routes.draw do
  
  # route for devise [Mountable Engine]
  devise_for :users, {
    :class_name   => "Admin::User",
    :path => '',
    :controllers  => {
        :registrations => "admin/registrations",
        :confirmations => "admin/confirmations",  
        :passwords     => "admin/passwords",          
        :sessions      => "admin/sessions",           
        :unlocks       => "admin/unlocks"       
    },
    :module       => :admin
  }
  
  # resource for users
  resources :users
  root to: 'users#index'
end
