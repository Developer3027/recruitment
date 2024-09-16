class AddColumnsToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :role, :integer, default: 0
  end
end
