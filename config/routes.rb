Admin::Engine.routes.draw do
  
  devise_for :users, {
    :class_name => "Admin::User",
    :module     => :devise
  }
  
  get 'debugger/index'
  root to: 'debugger#index'
end
