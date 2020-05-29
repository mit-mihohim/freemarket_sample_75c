class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false, index:true 
      t.text :text, null:false
      t.string :brand
      t.integer :status, null:false, default:0
      t.integer :delivery_charge_bearer, null:false, default:0
      t.integer :shipping_area, null:false, default:0
      t.integer :delivery_days, null:false, default:0
      t.integer :price, null:false
      t.references :categories, null: false, foreign_key: true
      t.references :buyer, foreign_key: {to_table: :users}
      t.references :seller, foreign_key:  {to_table: :users}
      t.timestamps null:false
    end
  end
end
