Rails.application.routes.draw do
  root 'books#search'
  post 'books' => 'books#create', as: 'books'
end
