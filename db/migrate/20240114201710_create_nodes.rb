class CreateNodes < ActiveRecord::Migration[7.1]
  def change
    create_table :nodes do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
