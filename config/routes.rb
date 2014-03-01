# require 'sidekiq/web'
# require 'sidetiq/web'

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

  get "prompt/to_do/:prompt_id", to: "prompts#to_do", as: "to_do_prompt"
  get "pages/to_do_index", to: "pages#to_do_index", as: "to_do_index"

  root 'pages#home'
end
