# weBudget - Backend 
This app was created to help keep track of your monthly expenses.

## The Details:
To get the front end up and runnning visit: https://github.com/Therealjustindude/webudget-frontend .

This app is built using a Rails API backend and React JS frontend. There is seed data so you can use a test account to try out my app.


### Backend: Rails 
This back end API is built with Rails. My front end sends fetch requests to the Rails API. The Rails API has four Models: 1)User 2)Expense 4)Debt 3)UserExpense. The relatioinships are, User has_many expenses, Expense belongs_to user, UserExpense belongs_to user and belongs_to expense

### Getting Started:

* Clone the repository

#### Set up the back end

* cd into the backend folder
* Bundle the gems 
```
bundle install
```

* Run migrations to build tables
```
rails db:migrate
```

* Seed database so you can sign in as test user
```
rails db:seed
```

* Start up the Rails server
```
rails s
```

