class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :name
      t.datetime :birthday

      t.timestamps
    end
  end
end
