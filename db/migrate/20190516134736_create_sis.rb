class CreateSis < ActiveRecord::Migration[5.2]
  def change
    create_table :sis do |t|
      t.string :name
      t.string :trigram

      t.timestamps
    end
  end
end
