class CreateOrderlistDtls < ActiveRecord::Migration[7.0]
  def change
    create_table :orderlist_dtls do |t|
      t.integer :list_id
      t.integer :prod_id
      t.integer :qty

      t.timestamps
    end
  end
end
