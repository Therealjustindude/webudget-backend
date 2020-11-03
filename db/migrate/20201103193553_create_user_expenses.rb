class CreateUserExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_expenses do |t|
      t.integer :expense_id
      t.integer :user_id

      t.timestamps
    end
  end
end
