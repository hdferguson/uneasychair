class AddConferenceToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :conference, :reference
  end
end
