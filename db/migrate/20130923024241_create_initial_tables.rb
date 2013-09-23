class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :name
    end
    create_table :shokunins do |t|
      t.references :prefecture
      t.references :profile
      t.timestamps
    end
    create_table :profiles do |t|
      t.references :shokunin
      t.boolean :active
      t.string :name
      t.text :contact
      t.text :content
    end
    add_index :profiles, :shokunin_id
    add_index :shokunins, :prefecture_id
  end
end
