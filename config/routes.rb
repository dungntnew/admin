Admin::Engine.routes.draw do
  
  # route for devise [Mountable Engine]
  devise_for :users, {
    :class_name   => "Admin::User",
    :controllers  => {
        :registrations => "admin/registrations",
        :confirmations => "admin/confirmations",  
        :passwords     => "admin/passwords",          
        :sessions      => "admin/sessions",           
        :unlocks       => "admin/unlocks"       
    },
    :module       => :admin
  }
  
  get 'debugger/index'
  root to: 'debugger#index'
end
