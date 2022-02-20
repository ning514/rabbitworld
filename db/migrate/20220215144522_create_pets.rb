class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :category
      t.string :name
      t.string :color
      t.integer :age
      t.text :remark
      t.integer :votes

      t.timestamps
    end
  end
end
