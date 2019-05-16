class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :si, foreign_key: true
      t.references :priority, foreign_key: true
      t.references :category, foreign_key: true
      t.references :subject, foreign_key: true
      t.datetime :date
      t.text :description
      t.boolean :disable
      t.boolean :recurrent

      t.timestamps
    end
  end
end
