Rails.application.routes.draw do

  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  root 'top#index'
  
  get 'top' => 'top#index'
  
  resources :equipments, only:[:index, :new, :edit, :update, :destroy, :create]
  
  get 'character' => 'character#index'
  get 'character/new' => 'character#new'
  post 'character/new' => 'character#create'
  delete 'character/:id' => 'character#destroy'
  patch 'character/:id'  => 'character#update'
  get 'character/:id/edit' => 'character#edit'

end
