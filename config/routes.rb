Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :expenses
        resources :debts
      end
      post 'authenticate', to: 'authentication#authenticate'
    end
  end
end
