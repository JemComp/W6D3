class Agane < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, name: "index_users_on_username"
    add_index :users, :username, unique: true
  end
end
