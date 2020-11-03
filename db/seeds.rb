justin = User.create(user_name: "JustinDev", email: "justin@gmail.com",
password: "1234")

groceries = Expense.create(user_id:1, description: "groceries", amount: 100.00, date_due: Date.today, bank_account: "joint", is_automatic: false, is_paid:true, is_money_in_account:true)
gas = Expense.create(user_id:1, description: "gas", amount: 40.00, date_due: Date.today, bank_account: "Justin's", is_automatic: false, is_paid:false, is_money_in_account:true)