Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'music#index'
  get 'search' => 'music#search'
  get 'music/auto_complete' => 'music#auto_complete'
end

