class AddActiveToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :active, :string
  end
end
