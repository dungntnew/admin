module Admin
  class User < ActiveRecord::Base
    
    # build roles
    enum role: {user: 0, editor: 1, admin: 2}
    
    after_initialize :set_default_role, :if => :new_record?
    
    def set_default_role
      self.role ||= :user
    end
    
    def to_s
      email
    end
    
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
  end
end
