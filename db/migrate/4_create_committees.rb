class CreateCommittees < ActiveRecord::Migration[5.0]
  def change
    create_table :committees do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :conference, foreign_key: true
      t.references :track, foreign_key: true
      t.timestamps
    end
  end
end
