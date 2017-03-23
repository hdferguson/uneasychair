class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :role
      t.references :conference
      t.references :account

      t.timestamps
    end
  end
end
