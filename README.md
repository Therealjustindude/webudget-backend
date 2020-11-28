# weBudget - Backend 


## The Details:

This app is built using a Rails API backend and React JS frontend.


### Backend: Rails 
This back end API is built with Rails. My front end sends fetch requests to the Rails API. The Rails API has three Models: 1)User 2)Expense 3)UserExpense. The relatioinships are, User has_many expenses, Expense belongs_to user, UserExpense belongs_to user and belongs_to expense

### Getting Started:

* Clone the repository

#### Set up the back end

* cd into the backend folder
```
* Bundle the gems 
```
bundle install
```
* create the db
```
rake db:create
```

* Run migrations to build tables
```
rake db:migrate
```

* Seed database 
```
rake db:seed
```

* Start up the Rails server
```
rails s
```

