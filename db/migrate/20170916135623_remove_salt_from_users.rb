class RemoveSaltFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :salt, :string
  end
end
