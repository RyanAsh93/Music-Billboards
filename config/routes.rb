Rails.application.routes.draw do
  root 'billboards#index'

  resources :billboards do
    resources :artists
  end

  resources :artists do
    resources :songs 
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
