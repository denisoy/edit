class CreateNodes < ActiveRecord::Migration[7.1]
  def change
    create_table :nodes do |t|
      t.string :title
      t.text :content
      t.references :parent, foreign_key: { to_table: :nodes }, index: true, null: true  # Додайте аргумент null: true
      t.timestamps
    end
  end
end