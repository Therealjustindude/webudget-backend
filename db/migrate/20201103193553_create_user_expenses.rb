class CreateUserExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_expenses do |t|
      t.integer :expense_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.integer :debt_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
