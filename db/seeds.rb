justin = User.create(user_name: "TestDev", email: "test@gmail.com",
password: "password")

exp1 = justin.expenses.create(description: "groceries", amount: 100.00, date_due: Date.today, bank_account: "joint", is_automatic: false, is_paid:true)
exp2 = justin.expenses.create(description: "gas", amount: 40.00, date_due: Date.today, bank_account: "Justin's", is_automatic: false, is_paid:false)


debt = justin.debts.create(title: "Honda", total: 20000.00, is_paid: false) 

exp3 = justin.expenses.create(description: "car", amount: 350.00, date_due: Date.today, bank_account: "joint", is_automatic: true, is_paid:false) 

debt.expenses << exp3

debt.save


