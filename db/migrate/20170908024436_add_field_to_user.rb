class AddFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    add_column :users, :birthday, :datetime
    add_column :users, :address, :string
    add_column :users, :role, :integer
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
