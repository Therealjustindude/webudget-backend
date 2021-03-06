class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :debt_id, index: true, foreign_key: true, optional: true
      t.string :description
      t.float :amount
      t.date :date_due
      t.string :bank_account
      t.boolean :is_automatic
      t.boolean :is_paid

      t.timestamps
    end
  end
end
