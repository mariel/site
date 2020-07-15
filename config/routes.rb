Rails.application.routes.draw do
  get 'welcome/index'
  resources :accounts
  get 'account/logIn' => 'accounts#logIn'
  root 'welcome#index'
end