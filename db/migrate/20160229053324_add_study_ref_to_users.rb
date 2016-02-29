class AddStudyRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :study, index: true, foreign_key: true
  end
end
