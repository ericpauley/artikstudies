class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :name
      t.text :description
      t.belongs_to :study, index: true, foreign_key: true
    end
    remove_column :studies, :instructions
  end
end
