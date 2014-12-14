class UserAuthorizer < ApplicationAuthorizer
  
  def self.updatable_by?(user)
    user.has_role?(:admin) || user.has_role?(:editor)
  end

  def self.creatable_by?(user)
    user.has_role?(:admin) || user.has_role?(:editor)
  end
  
  def self.readable_by?(user)
    user.has_role?(:admin) || user.has_role?(:editor)
  end
  
  def self.deletable_by?(user)
    user.has_role?(:admin)
  end
end
