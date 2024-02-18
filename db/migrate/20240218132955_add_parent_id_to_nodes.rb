class AddParentIdToNodes < ActiveRecord::Migration[7.1]
  def change
    add_reference(:nodes, :parent, foreign_key: { to_table: :nodes }, index: true, null: true)
  end
end
