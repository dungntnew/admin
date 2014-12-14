class Post < ActiveRecord::Base
  # Adds `creatable_by?(user)`, etc
  include Authority::Abilities
  
  # Set authorizer class to UserAuthorizer
  self.authorizer_name = 'UserAuthorizer'
  
end
