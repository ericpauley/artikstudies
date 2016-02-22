class AddDataToProbeDatapoints < ActiveRecord::Migration
  def change
    add_column :probe_datapoints, :data, :string
  end
end
