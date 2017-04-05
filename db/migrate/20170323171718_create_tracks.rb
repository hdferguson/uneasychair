class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :role
      t.references :conference
      t.integer :userid
      t.boolean :capproved
      t.boolean :uapproved

      t.timestamps
    end
  end
end
