class AddOption1ToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :option1, :string
  end
end
