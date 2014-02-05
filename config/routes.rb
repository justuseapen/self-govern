SelfGovern::Application.routes.draw do
  devise_for :users
  resources :prompts do
    resources :choices
  end
  root 'pages#home'
end
