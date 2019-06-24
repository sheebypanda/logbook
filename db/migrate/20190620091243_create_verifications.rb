class CreateVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :verifications do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.date :date
      t.text :commentaire

      t.timestamps
    end
  end
end
