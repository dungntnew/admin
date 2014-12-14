Rails.application.routes.draw do
 namespace :admin do                    #__admin:resource:route:book__
    resources :books     #__admin:resource:route:book__
 end                                    #__admin:resource:route:book__

 namespace :admin do                    #__admin:resource:route:phone__
    resources :phones     #__admin:resource:route:phone__
 end                                    #__admin:resource:route:phone__

  resources :phones

 namespace :admin do                    #__admin:resource:route:post__
    resources :posts     #__admin:resource:route:post__
 end                                    #__admin:resource:route:post__

 namespace :admin do                    #__admin:resource:route:item__
    resources :items     #__admin:resource:route:item__
 end                                    #__admin:resource:route:item__


        
        
        
          

  resources :items

  mount Admin::Engine => "/admin" 
  
  namespace :admin do
    resources :posts
   
  end
  
  namespace :ex  do
     resources :books
  end
end
