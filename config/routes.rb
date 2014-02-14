SelfGovern::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :prompts, only: [:new,:create,:show,:destroy] do
    resources :choices
    resources :comments
  end

  get "prompt/vote/:prompt_id", to: "prompts#vote", as: "vote_prompt"
  get "prompt/unvote/:prompt_id", to: "prompts#unvote", as: "unvote_prompt"

  get "choice/vote/:choice_id", to: "choices#vote", as: "vote_choice"
  get "choice/unvote/:choice_id", to: "choices#unvote", as: "unvote_choice"

  get "prompt/archive/:prompt_id", to: "prompts#archive", as: "archive_prompt"
  get "pages/archives_index", to: "pages#archives_index", as: "archives_index"

  root 'pages#home'
end
