class AddOption2ToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :option2, :string
  end
end
