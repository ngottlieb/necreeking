class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :phone
      t.string :email
      t.text :report
      t.integer :user_id

      t.timestamps
    end
  end
end
