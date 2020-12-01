class CreateDebts < ActiveRecord::Migration[6.0]
  def change
    create_table :debts do |t|
      t.string :title
      t.float :total
      t.boolean :is_paid
      t.integer :user_id,  index: true, foreign_key: true
      t.string :expenses, array: true

      t.timestamps
    end
  end
end
