class AddDescriptionToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :start, :datetime
    add_column :studies, :end, :datetime
    add_column :studies, :instructions, :text
  end
end
