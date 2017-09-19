class AddCurrentToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current, :integer
  end
end
