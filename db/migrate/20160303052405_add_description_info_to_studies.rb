class AddDescriptionInfoToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :description, :text
  end
end
