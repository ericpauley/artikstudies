class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :name, null: false
    end
  end
end
