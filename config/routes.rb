Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'ideas#index'
  # to create a like, we need a idea id in the url therefore nest it resources

  resources :ideas do
    resources :likes, only: [:create, :destroy], shallow: true
  end

  resources :users


  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end


end
