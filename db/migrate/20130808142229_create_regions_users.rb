class CreateRegionsUsers < ActiveRecord::Migration
  def change
    create_table :regions_users do |t|
      t.belongs_to :region
      t.belongs_to :user
    end
  end
end
