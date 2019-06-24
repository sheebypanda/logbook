class CreatePermanences < ActiveRecord::Migration[5.2]
  def change
    create_table :permanences do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.boolean :morning

      t.timestamps
    end
  end
end
