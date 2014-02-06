SelfGovern::Application.routes.draw do
  devise_for :users

  resources :prompts, only: [:new,:create,:show] do
    resources :choices
  end

  root 'pages#home'
end
