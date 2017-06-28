Rails.application.routes.draw do

  resources :custom_rules
  root 'check_outs#new'
  resources :check_out_products
  resources :check_outs
  resources :rules
  resources :products
  resources :currencies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
