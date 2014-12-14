# This migration comes from admin (originally 20141214050454)
class AddRoleToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :role, :integer
  end
end
