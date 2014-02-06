SelfGovern::Application.routes.draw do
  devise_for :users

  resources :prompts, only: [:new,:create,:show] do
    resources :choices
  end

  get "vote/:prompt_id", to: "prompts#vote", as: "vote_prompt"
  get "unvote/:prompt_id", to: "prompts#unvote", as: "unvote_prompt"

  root 'pages#home'
end
