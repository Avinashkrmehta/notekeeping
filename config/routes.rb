Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'notes_home#home'
  get 'noteskeeps/share_note'
  post 'noteskeeps/share_note'
  resources :noteskeeps
  # root 'noteskeeps#index'
end
