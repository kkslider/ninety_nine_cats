NinetyNineCats::Application.routes.draw do
  resources :cats
  resources :users, only: [:new, :create]
  resources :cat_rental_requests do
    member do
      put 'approve'
      put 'deny'
    end
  end
end
