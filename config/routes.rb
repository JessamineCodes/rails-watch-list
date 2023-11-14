Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:index, :show, :new, :create] do
    # prev had a new route for bookmarks but then moved new form onto list show page so didn't need
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
