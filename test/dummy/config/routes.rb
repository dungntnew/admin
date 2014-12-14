Rails.application.routes.draw do
  
  mount Admin::Engine => "/admin" 
  
  namespace :admin do
    resources :posts
   
  end
  
  namespace :ex  do
     resources :books
  end
end
