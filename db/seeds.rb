justin = User.create(user_name: "JustinDev", email: "justin@gmail.com",
password: "1234")

groceries = Expense.create(user_id:1, description: "groceries", amount: 100.00, date_due: Date.today, bank_account: "joint", is_automatic: false, is_paid:true)
gas = Expense.create(user_id:1, description: "gas", amount: 40.00, date_due: Date.today, bank_account: "Justin's", is_automatic: false, is_paid:false)
car = Expense.create(user_id:1, description: "car", amount: 350.00, date_due: Date.today, bank_account: "joint", is_automatic: true, is_paid:false, debt_id: 1)

car_debt= Debt.create(user_id:1, title: "Honda", total: 20000.00, is_paid: false, expenses: []) 