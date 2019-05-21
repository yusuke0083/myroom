Rails.application.routes.draw do

  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  root 'top#index'
  
  get 'top' => 'top#index'
  
  resources :equipments, only:[:index, :new, :edit, :update, :destroy, :create]
  resources :characters, only:[:index, :new, :edit, :update, :destroy, :create] 


end
