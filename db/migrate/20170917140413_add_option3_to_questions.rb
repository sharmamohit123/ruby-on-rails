class AddOption3ToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :option3, :string
  end
end
