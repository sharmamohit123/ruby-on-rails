class RemoveOptionsFormQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :options, :string
  end
end
