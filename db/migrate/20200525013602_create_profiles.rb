class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.string :last_name_kana,   null: false
      t.string :first_name_kana,  null: false
      t.integer :birth_year,      null: false, default: 0
      t.integer :birth_month,     null: false, dafault: 0
      t.integer :birth_date,      null: false, default: 0
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
