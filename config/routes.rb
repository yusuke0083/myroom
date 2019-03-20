Rails.application.routes.draw do
  root 'top#index'
  
  get 'top' => 'top#index'
  
  get 'equipment' => 'equipment#index'
  get 'equipment/new' => 'equipment#new'
  post 'equipment/new' => 'equipment#create'
  
  get 'character' => 'character#index'
  get 'character/new' => 'character#new'
  post 'character/new' => 'character#create'
end
