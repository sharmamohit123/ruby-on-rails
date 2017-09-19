class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.integer :userId
      t.integer :genreId
      t.integer :subgenreId
      t.integer :score
      t.string :status
      t.integer :current, :default => 1

      t.timestamps
    end
  end
end
