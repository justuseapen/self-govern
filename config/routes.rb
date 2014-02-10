SelfGovern::Application.routes.draw do
  devise_for :users

  resources :prompts, only: [:new,:create,:show,:destroy] do
    resources :choices
    resources :comments
  end

  get "prompt/vote/:prompt_id", to: "prompts#vote", as: "vote_prompt"
  get "prompt/unvote/:prompt_id", to: "prompts#unvote", as: "unvote_prompt"

  get "choice/vote/:choice_id", to: "choices#vote", as: "vote_choice"
  get "choice/unvote/:choice_id", to: "choices#unvote", as: "unvote_choice"

  root 'pages#home'
end
