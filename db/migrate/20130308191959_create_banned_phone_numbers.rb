class CreateBannedPhoneNumbers < ActiveRecord::Migration
  def change
    create_table :banned_phone_numbers do |t|
      t.integer :user_id
      t.boolean :banned

      t.timestamps
    end
  end
end
