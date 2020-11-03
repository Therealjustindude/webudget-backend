Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_expenses
      resources :users
      resources :expenses
    end
  end
end
