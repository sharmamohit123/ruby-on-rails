class RenameTypeToWhat < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :type, :what
  end
end
