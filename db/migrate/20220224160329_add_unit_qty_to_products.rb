class AddUnitQtyToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :unit_qty, :string
    add_column :products, :ttl_qty, :integer
  end
end
