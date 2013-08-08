class AddRegionToReports < ActiveRecord::Migration
  def change
    add_column :reports, :region_id, :integer
  end
end
