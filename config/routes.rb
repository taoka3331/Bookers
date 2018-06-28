Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  get '/users' => 'users#index'

  resources :books
  root to: 'books#top'
  get '/about' =>'books#about'
  get '/top' =>'books#top'
  get 'books/edit'
  delete '/books/:id'=> 'books#destroy', as: 'destroy_book'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
