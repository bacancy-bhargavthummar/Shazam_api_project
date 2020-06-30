Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'music#index'
  get 'search' => 'music#search'

end

# RAPIDAPI_API_KEY=f9687893f9mshb718f43cdcc2ec4p1d9757jsncba1405c4e05 rails s