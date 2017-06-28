Rails.application.routes.draw do

  resources :custom_rules
  root 'check_outs#new'
  resources :check_out_products
  post 'check_outs/scan' => 'check_outs#scan'
  patch 'check_outs/:id' => 'check_outs#close'
  resources :check_outs, only: [:index, :show, :new, :edit, :destroy]
  resources :rules
  resources :products
  resources :currencies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
