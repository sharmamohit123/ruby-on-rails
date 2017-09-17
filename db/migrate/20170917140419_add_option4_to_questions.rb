class AddOption4ToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :option4, :string
  end
end
