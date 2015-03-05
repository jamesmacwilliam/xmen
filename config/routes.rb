Rails.application.routes.draw do

  get '/' => 'home#index', as: :root

  resources :teams do
    resources :tasks
  end
end
