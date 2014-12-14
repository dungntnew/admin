module Admin
  class User < ActiveRecord::Base
    
    # Adds `can_create?(resource)`, etc
    include Authority::UserAbilities
    
    # Adds `creatable_by?(user)`, etc
    include Authority::Abilities
    
    # Set authorizer class to UserAuthorizer
    self.authorizer_name = 'UserAuthorizer'
    
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
           
           
    # Define some method using for user_othorizer
    def has_role?(role)
      true
    end
    
    # Define some method roles
    def roles
      "admin, editor"
    end
  end
end
