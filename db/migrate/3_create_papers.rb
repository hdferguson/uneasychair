class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :title
      t.string :author
      t.string :attachment
      t.references :conference, foreign_key: true
      t.timestamps
    end
  end
end