class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.string :options, array: true, default: []
      t.string :what
      t.integer :subgenreId

      t.timestamps
    end
  end
end
