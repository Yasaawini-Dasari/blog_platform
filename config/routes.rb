Rails.application.routes.draw do
  devise_for :users  

  resources :posts do
    collection do
      post :import_csv
    end
    member do
      get :download_pdf
    end
  end
  root "posts#index"




end
