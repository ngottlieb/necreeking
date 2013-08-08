class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
