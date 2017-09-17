class AddGenreIdToSubgenre < ActiveRecord::Migration[5.1]
  def change
    add_column :subgenres, :genreId, :integer
  end
end
