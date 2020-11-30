class CreateUserDebts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_debts do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :debt_id, index: true, foreign_key: true
      t.integer :expense_id, index: true, foreign_key: true


      t.timestamps
    end
  end
end
