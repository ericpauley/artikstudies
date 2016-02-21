class CreateProbes < ActiveRecord::Migration
  def change
    create_table :probes do |t|
      t.integer :serial_number, null:false
      t.belongs_to :user, null:true
    end
    create_table :probe_datapoints do |t|
      t.belongs_to :probe, null:false
      t.timestamps null:false
    end
  end
end
