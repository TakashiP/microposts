class AddPersonalAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :personal_info, :text
    add_column :users, :address, :text
  end
end
