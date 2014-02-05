SelfGovern::Application.routes.draw do
  devise_for :users

  resources :prompts, only: [:new,:create]

  root 'pages#home'
end
