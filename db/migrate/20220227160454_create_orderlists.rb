class CreateOrderlists < ActiveRecord::Migration[7.0]
  def change
    create_table :orderlists do |t|
      t.string :order_num
      t.integer :user_id
      t.date :buy_date
      t.string :buy_name
      t.string :buy_email
      t.string :buy_address
      t.string :buy_tel
      t.integer :amount

      t.timestamps
    end
  end
end
