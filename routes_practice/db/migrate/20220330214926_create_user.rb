class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :users, :name, null: false
      t.string :users, :email, null: false

    end
      add_index :users, [:name,:email]
  end
end
