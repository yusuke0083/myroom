Rails.application.routes.draw do

  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  root 'top#index'
  
  get 'top' => 'top#index'
  
  get 'equipment' => 'equipment#index'
  get 'equipment/new' => 'equipment#new'
  post 'equipment/new' => 'equipment#create'
  delete 'equipment/:id' => 'equipment#destroy'
  patch 'equipment/:id'  => 'equipment#update'
  get 'equipment/:id/edit' => 'equipment#edit'

  
  get 'character' => 'character#index'
  get 'character/new' => 'character#new'
  post 'character/new' => 'character#create'
  delete 'character/:id' => 'character#destroy'
  patch 'character/:id'  => 'character#update'
  get 'character/:id/edit' => 'character#edit'

end
