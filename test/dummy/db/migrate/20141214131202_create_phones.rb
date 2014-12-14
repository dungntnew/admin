class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :name
      t.string :contry
      t.string :number

      t.timestamps
    end
  end
end
