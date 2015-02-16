Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'

  resources :snippets, except: :create


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create', as: 'new_sign_up'

  patch 'stories/:id/upvote', to: 'votes#upvote', as: 'vote_up'
  delete '/vote/:id', to: 'votes#destroy', as: 'vote_delete'

  resources :users, only: [:show, :edit, :update, :delete]

  get 'stories/search', to: 'stories#search', as: 'stories_search'
  resources :stories, except: :create

  resources :tags
  get '/tags/:id/stories', to: 'tags#show', as: 'tags_show'
  # get '/stories/:id/tags', to: 'stories#show_tags', as: 'show_tags'
  resources :storytags

  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # post '/logout', to: 'sessions#destroy'



  patch 'snippets/:id/flag', to: 'snippets#flag', as: 'snippet_flag'
  patch 'stories/:id/flag', to: 'stories#flag', as: 'story_flag'

end

