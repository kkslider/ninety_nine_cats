NinetyNineCats::Application.routes.draw do
  resources :cats
  resources :cat_rental_requests do
    member do
      put 'approve'
      put 'deny'
    end
  end
end
