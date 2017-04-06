class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.text :comments
      t.references :paper, foreign_key: true
      t.integer :memberid
      t.timestamps
    end
  end
end
