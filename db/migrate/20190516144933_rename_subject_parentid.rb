class RenameSubjectParentid < ActiveRecord::Migration[5.2]
  def change
    rename_column :subjects, :parent_it, :parent_id
  end
end
