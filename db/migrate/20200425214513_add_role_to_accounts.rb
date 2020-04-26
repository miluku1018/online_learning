class AddRoleToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :role, :string, default: "user"
  end
end
