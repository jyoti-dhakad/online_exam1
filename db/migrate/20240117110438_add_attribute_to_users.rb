class AddAttributeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :collage_name, :text
    add_column :users, :mobile_number, :string
    add_column :users, :address, :text
  end
end
