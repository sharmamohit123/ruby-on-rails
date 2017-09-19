class AddCurrent1ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current1, :integer
  end
end
