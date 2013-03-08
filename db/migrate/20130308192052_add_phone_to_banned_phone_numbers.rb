class AddPhoneToBannedPhoneNumbers < ActiveRecord::Migration
  def change
    add_column :banned_phone_numbers, :phone, :string
  end
end
