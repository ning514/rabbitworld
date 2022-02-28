class AddPrivToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :priv, :string
  end
end
