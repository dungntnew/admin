class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :display_name
      t.datetime :birthday

      t.timestamps
    end
  end
end
