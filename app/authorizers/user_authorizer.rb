class UserAuthorizer < ApplicationAuthorizer

  def self.updatable_by?(user)
    user.role.to_sym == :admin
  end

  def self.creatable_by?(user)
    user.role.to_sym == :admin
  end

  def self.readable_by?(user)
    user.role.to_sym == :admin || user.role.to_sym  == :editor
  end

  def self.deletable_by?(user)
    user.role.to_sym == :admin
  end
end
