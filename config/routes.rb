Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'my-resumes', to: 'my_resumes#index'

  resources :jobs do
    resources :resumes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
